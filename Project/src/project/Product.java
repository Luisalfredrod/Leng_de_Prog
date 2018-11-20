/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

/**
 *
 * @author luisa
 */
import static java.lang.Thread.sleep;
import java.util.Random;

public class Product extends Thread {
    private int simul, produced, time;
    private double pm, tm, cost, income, profit,packs,tot_time, weight;
    private float size;
    private char product;
    private boolean flag = true;

    public void stopRunning(){
        flag = false;
    }

    public Product(int simul, float size, int produced) {
        super();
        this.size = size;
        this.simul = simul;
        this.produced = produced;
        this.product = product;
        Random rand = new Random();
        //Simulation 1----------------------------------------------------------
        if(this.simul == 0){
                this.product = 'p';
                this.produced = produced;
                this.weight = 0.38;
                this.packs = (this.size/weight);
                this.time = 26740/this.produced;
                this.tot_time= (this.time*this.packs)/360000;
                this.pm = (this.produced*(0.0142));
                this.tm = (double)(this.time)/1000;
                this.cost= ((this.produced*0.38)+0.2433)*this.packs;// ((Number of personnel * salary)+ cost of diferent services)* amount<>All cost are evaluated for one package of 0.38kg
                this.income= 2.40 * this.packs;
                this.profit= this.income - this.cost;
        }
        if(this.simul == 1){
                this.product = 'y';
                this.produced =  produced;
                this.weight = 0.17;
                this.packs = (this.size/weight);
                this.time = 6030/this.produced;
                this.tot_time= (this.time*this.packs)/360000;// hours taken to complete the size
                this.pm = (this.produced*(0.0281));
                this.tm = (double)(this.time)/1000;
                this.cost= ((this.produced*0.23)+0.001134)*(packs);// ((Number of personnel * salary)+ cost of diferent services)* amount<>All cost are evaluated for one package of 0.38kg
                this.income= 1.45 * this.packs;
                this.profit= this.income - this.cost;
        }else{
            this.product = 'y';
            this.produced =  produced;
            this.weight = 0.17;
            this.packs = (this.size/weight);
            this.time = 6030/this.produced;
            this.tot_time= (this.time*this.packs)/360000;// hours taken to complete the size
            this.pm = (this.produced*(0.0281));
            this.tm = (double)(this.time)/1000;
            this.cost= ((this.produced*0.23)+0.001134)*(packs);// ((Number of personnel * salary)+ cost of diferent services)* amount<>All cost are evaluated for one package of 0.38kg
            this.income= 1.45 * this.packs;
            this.profit= this.income - this.cost;
        }
    }

    public boolean has_finish(){
        return !flag;
    }

    public void getStats(){
        if(this.product == 'p'){
            System.out.printf("\n\tAmount to produce PRODUCT 1\n\t- %f kg -\n", this.size);
            System.out.printf("\n\tPATACONES\n");
            System.out.printf("Produced packets: %.0f units \n", this.packs);
            System.out.printf("Produced by minute: %f Kg \n", this.pm);
            System.out.printf("Time of production of one bag (0.38Kg): %f \n", this.tm);
            System.out.printf("Work hours to complete task: %f \n", this.tot_time);
            System.out.printf("Cost of all production:  $ %.2f\n", this.cost);
            System.out.printf("Income of all production:  $ %.2f\n", this.income);
            System.out.printf("Profit of all production:  $ %.2f\n", this.profit);
            
        }else{
            System.out.printf("\n\tAmount to produce PRODUCT 2\n\t- %f kg -\n", this.size);
            System.out.printf("\n\tPRODUCT\n");
            System.out.printf("Produced packets: %.0f units \n", this.packs);
            System.out.printf("Produced by minute: %f Kg \n", pm);
            System.out.printf("Time of production of one bag (0.17Kg): %.2f \n", tm);
            System.out.printf("Work hours to complete task: %f \n", this.tot_time);
            System.out.printf("Cost of all production:  $ %.2f\n", this.cost);
            System.out.printf("Income of all production:  $ %.2f\n", this.income);
            System.out.printf("Profit of all production:  $ %.2f\n", this.profit);
        }
    }

    public double getProfits() {
        return this.profit;
    }
    public double getCosts() {
        return this.cost;
    }
    public double getIncomes() {
        return this.income;
    }

    public void run() {
        while(this.size<0){
            try{
                sleep(time);
            }catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.size -= (this.produced*this.weight);
        }
    }
}
