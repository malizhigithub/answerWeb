package cn.edu.lingnan.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

/**
 * @version 1.0
 * @author huang
 * 不知道为什么使用Maven generate-source 反向工程失败, 只能手动来了
 */

public class GeneratorSqlmap {
	
	public void generator() throws Exception {
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
		
		File configFile = new File("mysqlGeneratorConfig.xml");
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		myBatisGenerator.generate(null);
	}
	
	public static void main(String[] args) {
		try{
			new GeneratorSqlmap().generator();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
