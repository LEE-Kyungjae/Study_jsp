package boj10813;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		int m = sc.nextInt();
		int[] arr = new int[n];
		int i, j;
		int tmp;
		for (int x = 0; x < n; x++) {
			arr[x]=x+1;
		}
		for (int k = 0; k < m; k++) {
			i = sc.nextInt();
			j = sc.nextInt();
			tmp=arr[i-1];
			arr[i-1]=arr[j-1];
			arr[j-1]=tmp;
		}
		for (int k = 0; k < n; k++) {
			System.out.println(arr[k]);
		}
	}
}

//	0	1	2	3	4

//	1	2	3	4	5
