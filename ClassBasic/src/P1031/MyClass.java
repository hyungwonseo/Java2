package P1031; // 패키지 정의부분 (인텔리제이가 자동으로 부여함)

// #1. 다른 패키지에 있는 외부클래스를 사용하려면 import해야만 함
//import java.util.Arrays;

// MyClass.java파일내의 유일한 public 클래스임
// 반드시 파일명과 클래스이름이 동일해야함!!
public class MyClass {
    public static void main(String[] args) {
        String[] strings = {"Hello", "World"};
        //System.out.println(Arrays.toString(strings));
        // #2. import없이 풀네임을 사용할 수도 있음
        System.out.println(java.util.Arrays.toString(strings));
    }
}
