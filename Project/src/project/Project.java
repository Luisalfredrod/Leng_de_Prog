/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;
import java.util.Scanner;

/**
 *
 * @author luisa
 */
public class Project {


    public static void main(String args[]) {
        boolean flag = true;
        float totalp=0,totalc=0,income=0;
        int amtprod=0;
        Product threads[];
        
        
        Scanner input = new Scanner(System.in);
        
        System.out.print("\nEnter number of products: ");
    	amtprod = input.nextInt();
        int[] size = new int[amtprod];
        int[] personnel = new int [20];
        threads = new Product[amtprod];
        
        for (int i = 0; i<amtprod;i++){
            System.out.printf("\nEnter amount of product %d (kg): ",(i+1));
            size[i] = input.nextInt();
        
            System.out.printf("\nEnter the number of personnel for product %d: ",(i+1));
            personnel[i] = input.nextInt();
        }
                
        for (int i = 0; i < amtprod; i++){
            threads[i] = new Product(i, size[i], personnel[i]);   
        }
//------------------------------------------------------------------------------        
        
        System.out.printf("\n--------Product simulation--------\n");
        for (int i = 0; i < amtprod; i++) {
            threads[i].getStats();
        }
        
        for (int i = 0; i < amtprod; i++) {
            threads[i].start();
        }

        for (int i = 0; i < threads.length; i++) {
            try {
                threads[i].join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.printf("\n\t -Results-\n");
        for (int i = 0; i < threads.length; i++) {
            totalp += threads[i].getProfits();
            totalc += threads[i].getCosts();
            income += threads[i].getIncomes();
        }
        System.out.printf("\nTOTAL COST: %.2f\nTOTAL PROFIT: %.2f\tPROFIT PERSENTAGE: %.2f%%\n",totalc,totalp,((totalp/income)*100));
        
//------------------------------------------------------------------------------

    }
    
    
}
