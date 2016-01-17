
import javax.jms.*;
import javax.naming.*;
import java.io.*;
import java.io.InputStreamReader;
import java.util.Properties;

public class HelloWorld {
    
    public static TopicConnectionFactory	topicConnectionFactory;
    public static TopicConnection       	topicConnection;
    public static TopicSession		        topicSessionP;
    public static TopicSession		        topicSessionS;
    public static TopicPublisher	       	topicPublisher;
    public static TopicSubscriber       	topicSubscriber;
    public static Topic				topic;

    public static void main(String argv[]) {

	try {
	    
            InitialContext ic = null;
            // Connexion avec le JNDI (serveur de nom)
            // Par défaut va chercher ip et port dans le CLASSPATH
            ic = new InitialContext();
	    
	        // Les infos pour se connecter au serveur sont dans le JNDI
	        topicConnectionFactory = (TopicConnectionFactory)ic.lookup("ConnFactory");
	        // Les infos sur le topic enregistré dans le JNDI
            topic = (Topic)ic.lookup("Topic");
            
            System.out.println("Bound to TCF and Topic");
            
            // Demande une connexion avec de type "avec un topic" et la démarre
            topicConnection = topicConnectionFactory.createTopicConnection();
            topicConnection.start();

            System.out.println("Created topic connection");
            
            // Création de deux sessions "type sur topic" sur la connexion
            System.out.println("Creating topic session: not transacted, auto ack");
            topicSessionP = topicConnection.createTopicSession(false,1);
            topicSessionS = topicConnection.createTopicSession(false,1);
            
            // Création de lecteur/rédacteur sur le topic
	        topicPublisher = topicSessionP.createPublisher(topic);
	        topicSubscriber = topicSessionS.createSubscriber(topic);
            
            // Ajouter un listener au lecteur
	        topicSubscriber.setMessageListener(new MsgListener());
	        
	        System.out.println("Ready");
	        
	        TextMessage textmsg = topicSessionP.createTextMessage();	
	        textmsg.setText("Hello World !!!");
      	    topicPublisher.publish(textmsg);

      	} catch (Exception ex) {
		    ex.printStackTrace();
		    return;
	    }

	
    }
}


class MsgListener implements MessageListener {
	public void onMessage(Message msg)  {
		try {
			TextMessage textmsg = (TextMessage)msg;
			System.out.println(textmsg.getText());
	    		//HelloWorld.topicSubscriber.setMessageListener(null);
	    		HelloWorld.topicSubscriber.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
