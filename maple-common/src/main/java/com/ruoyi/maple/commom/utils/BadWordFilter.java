package com.ruoyi.maple.commom.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;
import java.util.Map;

public class BadWordFilter {
    static Map<String, String[]> words = new HashMap<>();
    static int largestWordLength = 0;

    public static void loadConfigs(List<String> sensitiveWordList) {
        String line = "";
        for (int i = 0; i < sensitiveWordList.size(); i++) {
            line = sensitiveWordList.get(i);
            String[] content;
            content = line.split(",");
            if(content.length == 0) {
                continue;
            }
            String word = content[0];
            String[] ignore_in_combination_with_words = new String[]{};
            if(content.length > 1) {
                ignore_in_combination_with_words = content[1].split("_");
            }
            if(word.length() > largestWordLength) {
                largestWordLength = word.length();
            }
            words.put(word.replaceAll(" ", ""), ignore_in_combination_with_words);
        }

    }

    public static void loadConfigs() {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(new URL("https://docs.google.com/spreadsheets/d/1hIEi2YG3ydav1E06Bzf2mQbGZ12kh2fe4ISgLg_UBuM/export?format=csv").openConnection().getInputStream()));
            String line = "";
            int counter = 0;
            while((line = reader.readLine()) != null) {
                counter++;
                String[] content = null;
                try {
                    content = line.split(",");
                    if(content.length == 0) {
                        continue;
                    }
                    String word = content[0];
                    String[] ignore_in_combination_with_words = new String[]{};
                    if(content.length > 1) {
                        ignore_in_combination_with_words = content[1].split("_");
                    }
                    if(word.length() > largestWordLength) {
                        largestWordLength = word.length();
                    }
                    words.put(word.replaceAll(" ", ""), ignore_in_combination_with_words);
                } catch(Exception e) {
                    e.printStackTrace();
                }
            }
            System.out.println("Loaded " + counter + " words to filter out");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<String> badWordsFound(String input) {
        if(input == null) {
            return new ArrayList<>();
        }
        input = input.toLowerCase().replaceAll("[^a-zA-Z]", "");
        ArrayList<String> badWords = new ArrayList<>();
        for(int start = 0; start < input.length(); start++) {
            for(int offset = 1; offset < (input.length()+1 - start) && offset < largestWordLength; offset++)  {
                String wordToCheck = input.substring(start, start + offset);
                if(words.containsKey(wordToCheck)) {
                    String[] ignoreCheck = words.get(wordToCheck);
                    boolean ignore = false;
                    for(int s = 0; s < ignoreCheck.length; s++ ) {
                        if(input.contains(ignoreCheck[s])) {
                            ignore = true;
                            break;
                        }
                    }
                    if(!ignore) {
                        badWords.add(wordToCheck);
                    }
                }
            }
        }
        for(String s: badWords) {
            System.out.println(s + " qualified as a bad word in a username");
        }
        return badWords;
    }

    /**
     * 是否检测有检测词 是：true 否：false
     * @param input 待检测词
     * @return 是否检测有检测词 是：true 否：false
     */
    public static boolean filterText(String input) {
        ArrayList<String> badWords = badWordsFound(input);
        if(badWords.size() > 0) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        loadConfigs();
        boolean filteredText = filterText("This is a test message with a bad word");
        System.out.println(filteredText);
    }
}