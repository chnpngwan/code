import java.util.Arrays;

/**
 * ProjectName:  ssm
 * PackageName:  PACKAGE_NAME
 * ClassName:    ArrayComparison
 *
 * @Author chnpngwng
 * @Date 2023 07 16 16 01
 **/


public class ArrayComparison {
    /*public static void main(String[] args) {
        int[] array1 = {4, 5, 7, 8};
        int[] array2 = {2, 3, 1, 0};
        int[] newArray = new int[array1.length];
        for (int i = 0; i < array1.length; i++) {
            int quotient = array1[i] / 2;
            if ((array1 == null || array1.length == 0) || (array2 == null || array2.length == 0)) {
                System.out.println("数组有空值！！！");
            } else if (quotient > array2[i]) {
                newArray[i] = 0;
            } else {
                newArray[i] = array2[i];
            }
        }
        System.out.println(Arrays.toString(newArray));
    }*/
    /*public static void main(String[] args) {
        int[] array1 = {4, 5, 7, 8};
        int[] array2 = {2, 3, 1, 0};

        if (array1 == null || array1.length == 0 || array2 == null || array2.length == 0) {
            System.out.println("数组有空值！！！");
            return;
        }

        int[] newArray = new int[array1.length];

        for (int i = 0; i < array1.length; i++) {
            int quotient = array1[i] / 2;
            System.out.println(quotient);
            newArray[i] = Math.min(quotient, array2[i]);
        }

        System.out.println(Arrays.toString(newArray));
    }*/

    public static void main(String[] args) {
        int[] array1 = {4, 5, 7, 8};
        int[] array2 = {2, 3, 1, 0};

        if (array1 == null || array1.length == 0 || array2 == null || array2.length == 0) {
            System.out.println("数组有空值！！！");
            return;
        }

        int[] newArray = new int[array1.length];

        if (array1.length != array2.length) {
            System.out.println("数组长度不同！！！");
        } else {
            for (int i = 0; i < array1.length; i++) {
                int quotient = array1[i] / 2; 
                newArray[i] = Math.min(quotient, array2[i]);
            }
            System.out.println(Arrays.toString(newArray));
        }
    }


}
