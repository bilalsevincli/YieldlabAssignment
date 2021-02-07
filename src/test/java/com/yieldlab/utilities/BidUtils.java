package com.yieldlab.utilities;

public class BidUtils {

    public static int bidA = Integer.parseInt(ConfigurationReader.get("bidA"));
    public static int bidB = Integer.parseInt(ConfigurationReader.get("bidB"));
    public static int bidC = Integer.parseInt(ConfigurationReader.get("bidC"));

    public int newBitA = bidA;
    public int newBitB = bidB;
    public int newBitC = bidC;

    public int findMaxBid(int bidA, int bidB, int bidC){
        if (bidA>=bidB && bidA>=bidC){
            return bidA;
        }else if (bidB>=bidA && bidB>=bidC){
            return bidB;
        }else{
            return bidC;
        }
    }

    public void getActualBid(String key, int value){

        switch (key) {
            case "a":
                newBitA = value * bidA;
                break;
            case "b":
                newBitB = value * bidB;
                break;
            case "c":
                newBitC = value * bidC;
                break;
        }
    }

    public int getWinner(String key1, int value1, String key2, int value2, String key3, int value3){
        getActualBid(key1,value1);
        getActualBid(key2,value2);
        getActualBid(key3,value3);
        return findMaxBid(newBitA,newBitB,newBitC);
    }

    public int getWinner(String key1, int value1, String key2, int value2){
        getActualBid(key1,value1);
        getActualBid(key2,value2);
        return findMaxBid(newBitA,newBitB,newBitC);
    }

    public int getWinner(String key1, int value1){
        getActualBid(key1,value1);
        return findMaxBid(newBitA,newBitB,newBitC);
    }
}
