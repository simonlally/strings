// Simon Lally
// String Reversal

public class StringReversal {
    //constructor that accepts a string
    public StringReversal(String str) {
        if (str != null) {
            String strRev = reverse(str);
            System.out.println(strRev);
        } else {
            System.out.println("invalid input");
            return;
        }
    }

    String reverse(String str) {
        //convert the string into a char array
        char [] arr = str.toCharArray();
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < i; j++) {
                swap(arr, i, j);
            }
        }
        return new String(arr);
    }

    void swap(char [] chArr, int x, int y) {
        char tmp = chArr[x];
        chArr[x] = chArr[y];
        chArr[y] = tmp;
        
    }

    public static void main(String [] args) {
        StringReversal sr = new StringReversal("frogs");
    }
}