package com.mdx.user;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author : jiagang
 * @date : Created in 2023/12/16 16:36
 */
public class ThreadPoolTest {

    public static void main(String[] args) {
        ExecutorService executorService = Executors.newFixedThreadPool(2);
        executorService.execute(() ->{
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.println("nihao");
        });

        executorService.execute(() ->{
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.println("nihao1");
        });

        //ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor();

        Thread thread = new Thread(()->{

        });
        thread.start();


    }


}
