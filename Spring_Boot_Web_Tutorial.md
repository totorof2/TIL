# Spring Boot를 이용한 웹 프로젝트 만들기

## 목표
- IntelliJ IDEA로 간단한 Spring Boot 프로젝트를 만들어보자
- Spring Boot + FreeMarker + MySQL + jQuery + Bootstrap

## Spring Boot 프로젝트 생성
### 방법1 - spring.io
- http://start.spring.io/ 에서 Group, Artifact, Dependencies 선택하고 프로젝트 다운로드

### 방법2 - IntelliJ IDEA Spring Initializr
- IntelliJ IDEA에서 New -> Spring Boot Initializr 를 선택하고 생성

### 방법3 - IntelliJ IDEA Gradle Project
- IntelliJ IDEA에서 Gradle 프로젝트 생성하고 build.gradle에 플러그인 및 라이브러리 추가
- [Maven Repository](https://mvnrepository.com/) 에서 필요한 라이브러리 검색할 수 있음

``` groovy
group 'first.app'
version '1.0-SNAPSHOT'

apply plugin: 'java'
apply plugin: 'idea'
apply plugin: 'org.springframework.boot'

jar {
    baseName = 'first-app'
    version = '0.0.1-SNAPSHOT'
}

buildscript {
    ext {
        springBootVersion = '1.4.3.RELEASE'
    }
    repositories {
        mavenCentral()
    }
    dependencies {
        classpath("org.springframework.boot:spring-boot-gradle-plugin:${springBootVersion}")
    }
}

sourceCompatibility = 1.5

repositories {
    mavenCentral()
}

dependencies {
    compile group: 'org.springframework.boot', name: 'spring-boot-starter-freemarker', version: "${springBootVersion}"
    compile group: 'org.springframework.boot', name: 'spring-boot-starter-web', version: "${springBootVersion}"
    compile group: 'org.springframework.boot', name: 'spring-boot-starter-test', version: "${springBootVersion}"
}
```

## 디렉토리 생성
- default 디렉토리 구조. 템플릿 경로 등을 바꾸려면 별도 설정을 해주어야 한다.

```
- 프로젝트 Root
  ㄴ src/main/java                 (프로덕션 코드)
  ㄴ src/main/resources            (프로덕션 리소스)
  ㄴ src/main/resources/templates  (템플릿 파일. ex - Freemarker)
  ㄴ src/test/java                 (테스트 코드)
  ㄴ src/test/resources            (테스트 리소스)
```

## package 생성
- src/main/java 밑에 패키지를 생성한다.
- 패키지 구조는 개발자 맘대로. 우선 최상단 패키지로 hello를 생성하자
- 참고 : http://egloos.zum.com/springmvc/v/434948

```
ㄴ src/main/java/hello
```

## 템플릿 없이 웹페이지에 Hello 띄우기

``` java
/* /src/main/java/hello/HelloApplication.java */
package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class HelloApplication {
    public static void main(String[] args) {
        SpringApplication.run(HelloApplication.class, args);
    }
}
```

``` java
/* /src/main/java/hello/HelloController.java */
package hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String hello() {
        return "hello";
    }
}
```

- Gradle Tasks > application > bootRun 실행
- http://localhost:8080/hello 접속해서 확인 
