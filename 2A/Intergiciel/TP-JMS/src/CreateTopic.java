import org.objectweb.joram.client.jms.admin.*;
import org.objectweb.joram.client.jms.*;
import org.objectweb.joram.client.jms.tcp.*;

public class CreateTopic {
  public static void main(String args[]) throws Exception {
    System.out.println();
    System.out.println("CreateTopic administration phase... ");

    // Connecting to JORAM server:
    AdminModule.connect("root", "root", 60);

    // Creating the JMS administered objects:        
    javax.jms.TopicConnectionFactory connFactory =
      TopicTcpConnectionFactory.create("localhost", 16010);

    Topic topic = (Topic) Topic.create(0);

    // Creating an access for user anonymous:
    User user = User.create("anonymous", "anonymous", 0);

    // Setting free access to the topic:
    topic.setFreeReading();
    topic.setFreeWriting();

    // Binding objects in JNDI:
    javax.naming.Context jndiCtx = new javax.naming.InitialContext();
    jndiCtx.bind("ConnFactory", connFactory);
    jndiCtx.bind("Topic", topic);
    jndiCtx.close();
    
    AdminModule.disconnect();
    System.out.println("Admin closed.");
  }
}
