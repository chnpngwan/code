package com.cya.dto;

public class Specialty  implements java.io.Serializable {


    // Fields    

     private Integer id;  //专业编号
     private String enterYear; //开设年份
     private String name;  //专业名称
     private String langthYear;  //专业学制
     private Boolean isFinish;  //是否结业 0:未结业 1:结业


    // Constructors

    /** default constructor */
    public Specialty() {
    }

    
    /** full constructor */
    public Specialty(String enterYear, String name, String langthYear, Boolean isFinish) {
        this.enterYear = enterYear;
        this.name = name;
        this.langthYear = langthYear;
        this.isFinish = isFinish;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getEnterYear() {
        return this.enterYear;
    }
    
    public void setEnterYear(String enterYear) {
        this.enterYear = enterYear;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getLangthYear() {
        return this.langthYear;
    }
    
    public void setLangthYear(String langthYear) {
        this.langthYear = langthYear;
    }

    public Boolean getIsFinish() {
        return this.isFinish;
    }
    
    public void setIsFinish(Boolean isFinish) {
        this.isFinish = isFinish;
    }
   








}