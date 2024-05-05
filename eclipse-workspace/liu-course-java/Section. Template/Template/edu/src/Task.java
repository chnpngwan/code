public class Task {

    private Integer age = 10;

    public static void main(String[] args) {

        Task task = new Task();

        System.out.println(task.getAge());
    }


    public Integer getAge() {
        return age;
    }
}