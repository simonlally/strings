// Print the duplicates of a given String
// Simon Lally

import java.util.HashMap;

public class Duplicates {
    Duplicates(String str) {
        getDuplicates(str);
    }

    void getDuplicates(String str) {
        // convert the string into an array of chars
        char [] charArray = str.toCharArray();
        // map to hold each char and the amount of 
        HashMap<Character, Integer> map = new HashMap<Character, Integer>();
        // iterate through the array and populate the map
        for (char ch: charArray) {
            if (map.containsKey(ch)) {
                map.put(ch, map.get(ch)+1);
            } else {
                map.put(ch, 1);
            }
        }
        // print the newly populated map
        map.forEach((k,v)->{
            System.out.println("letter: " + k + " count " + v);
        });
    }
    
    public static void main(String [] args) {
        Duplicates dup = new Duplicates("cheese");
    }

}