# AACS3134 Information Systems Development

## Libraries Required

https://github.com/javaee/javamail/releases
Direct jar file.

https://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-java-plat-419418.html#jaf-1.1-fr-oth-JPR
Accept TOC, download 1.1.1, open zip file, what you need is only the jar file.

https://search.maven.org/artifact/com.google.code.gson/gson/2.8.5/jar
Right side should there's a download button, click and select jar.

## Using DBII to initialize images

Run `/src/java/DBII.java` to insert image into Database.

## Settings up Environment Variable for servers
Why environment variable?  
So we don't have to keep passwords and sensitive info in raw text inside the project.

1. Go to the Tomcat Properties Platform Settings

    In Netbeans, click the **Services** tag. Under **Servers**, you'll see *Tomcat* or *GlassFish*. Right click and select **Properties**. Then select the **Platform** tab.

2. Under VM Options, add -Dvariable=value

    Leave the D in place, and replace the variable with whatever variable name you'd like to set and value whatever value you'd like to set the variable to.

    In this project we would use variable *mail* and *pass* so it would be like this:-  
    `-Dmail=??? -Dpass=???`

3. Finally, we are able to retrive the variables through this:-

    `System.out.println("Your email address is " + System.getProperty("mail"));`

## Project Structure

Project design and database scripts should be in the folder `./structure`  
Try to make root directory clean as possible tnx.
