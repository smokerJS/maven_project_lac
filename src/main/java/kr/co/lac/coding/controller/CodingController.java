package kr.co.lac.coding.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/coding")
public class CodingController {
	
	
	@RequestMapping("/compile.json")
	@ResponseBody
	public String compile(String source)throws Exception{
		File mfile = new File("C:\\java-lec\\upload\\MyApp.java"); //소스 파일 작성
        FileWriter writer = null;
        try {
            writer = new FileWriter(mfile);
            writer.write(source);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        Runtime run = Runtime.getRuntime();
		Process proc = run.exec(new String[] {"C:\\Program Files\\Java\\jdk1.8.0_161\\bin\\javac", 
							   "C:\\java-lec\\upload\\MyApp.java"});
		proc.waitFor();
		
		proc = run.exec(
				new String[] {
						"C:\\Program Files\\Java\\jdk1.8.0_161\\bin\\java", 
						"-Dfile.encoding=UTF8", 
						"-cp", 
						"C:\\java-lec\\upload", "MyApp"});
		InputStream in = proc.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
		String result = "";
		while (true) {
			String line = br.readLine();
			if (line == null) {
				break;
			}
			result += line+"\n";
		}
		System.out.println(result);		
		return result;
	}

}








