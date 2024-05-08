package com.bigdata.spark.rdd.dep;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import scala.Tuple2;

import java.util.ArrayList;
import java.util.List;

public class Spark02_Dep {
    public static void main(String[] args) throws Exception{

        final SparkConf conf = new SparkConf();
        conf.setMaster("local[*]");
        conf.setAppName("spark");

        final JavaSparkContext jsc = new JavaSparkContext(conf);

        final List<Tuple2<String, Integer>> datas =
                new ArrayList<>();
        datas.add(new Tuple2<String, Integer>("a", 1));
        datas.add(new Tuple2<String, Integer>("a", 2));
        datas.add(new Tuple2<String, Integer>("a", 3));
        datas.add(new Tuple2<String, Integer>("a", 4));

        final JavaRDD<Tuple2<String, Integer>> rdd = jsc.parallelize(datas, 2);
        //System.out.println(rdd.rdd().dependencies());
        //System.out.println("*******************************************");
        final JavaPairRDD<String, Integer> mapRDD = rdd.mapToPair(t -> t);
        // TODO org.apache.spark.OneToOneDependency : 窄依赖
        //System.out.println(mapRDD.rdd().dependencies());
        //System.out.println("*******************************************");
        final JavaPairRDD<String, Integer> wordCountRDD = mapRDD.reduceByKey(Integer::sum);
        // TODO org.apache.spark.ShuffleDependency : 宽依赖
        //System.out.println(wordCountRDD.rdd().dependencies());
        System.out.println("*******************************************");

        // Stage = 1 + 1 = 2
        // Task = 2 + 2 + 2 = 6
        wordCountRDD.collect();
        System.out.println("计算完毕");

        // http://localhost:4040

        Thread.sleep(10000000L);
        //.forEach(System.out::println);

        jsc.close();

    }
}