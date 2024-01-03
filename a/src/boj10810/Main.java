package boj10810;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		int m = sc.nextInt();
		int arr[] = new int[n];
		int i,j,k;
		
		for (int x = 0; x < m; x++) {
			 i=sc.nextInt();
			 j =sc.nextInt();
			 k =sc.nextInt();
			for(int y=i-1;y<=j-1; y++) {
				arr[y]=k;
			}
		}
		
		for (int z = 0; z < n; z++) {
			System.out.println(arr[z]);
		}
	}
}


//1	2	3	4	5
//
//0	0	0	0	0					
//3	3	0	0	0
//3	3	4	4	0
//1	1	1	1	0
//1	2	1	1	0
