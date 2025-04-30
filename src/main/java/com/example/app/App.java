package com.example.app;

public class App {
    public String greet() {
        return "Hello, world!";
    }

    public static void main(String[] args) {
        System.out.println(new App().greet());
    }
}
