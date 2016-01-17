import java.awt.*;
import java.awt.event.*;
import java.lang.*;
import java.util.*;

import javax.jms.*;
import javax.naming.*;

public class Irc {
    public static TextArea		text;
    public static TextField	        data;
    public static Frame 		frame;
    
    public static TopicConnectionFactory	topicConnectionFactory;
    public static TopicConnection       	topicConnection;
    public static TopicSession		        topicSessionP;
    public static TopicSession		        topicSessionS;
    public static TopicPublisher	       	topicPublisher;
    public static TopicSubscriber       	topicSubscriber;
    public static Topic				topic;

    public static void main(String argv[]) {
	
	// creation of the GUI 
	frame=new Frame();
	frame.setLayout(new FlowLayout());
	
	text=new TextArea(10,55);
	text.setEditable(false);
	text.setForeground(Color.red);
	frame.add(text);
	
	data=new TextField(55);
	frame.add(data);
	
	Button write_button = new Button("write");
	write_button.addActionListener(new writeListener());
	frame.add(write_button);
	
	Button connect_button = new Button("connect");
	connect_button.addActionListener(new connectListener());
	frame.add(connect_button);
	
	Button who_button = new Button("who");
	who_button.addActionListener(new whoListener());
	frame.add(who_button);
	
	Button leave_button = new Button("leave");
	leave_button.addActionListener(new leaveListener());
	frame.add(leave_button);
	
	frame.setSize(470,300);
	text.setBackground(Color.black); 
	frame.show();
    }

    /* allow to print something in the window */
    public static void print(String msg) {
    	try {
    		text.append(msg+"\n");
    	} catch (Exception ex) {
		ex.printStackTrace();
		return;
	}	
    }
}


// action invoked when the "write" button is clicked
class writeListener implements ActionListener {
	public void actionPerformed (ActionEvent ae) {
		try {
			TextMessage textMsg = Irc.topicSessionP.createTextMessage();
			textMsg.setText(Irc.data.getText());
 			Irc.topicPublisher.publish(textMsg);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

// action invoked when the "connect" button is clicked
class connectListener implements ActionListener {
	public void actionPerformed (ActionEvent ae) {
	   try {
		InitialContext ic = new InitialContext();
		Irc.topicConnectionFactory = (TopicConnectionFactory)ic.lookup("ConnFactory");
		Irc.topic = (Topic)ic.lookup("Topic");
		Irc.topicConnection = Irc.topicConnectionFactory.createTopicConnection();
		Irc.topicConnection.start();
		Irc.topicSessionP = Irc.topicConnection.createTopicSession(false, 1);
		Irc.topicSessionS = Irc.topicConnection.createTopicSession(false, 1);
		Irc.topicPublisher = Irc.topicSessionP.createPublisher(Irc.topic);
		Irc.topicSubscriber = Irc.topicSessionS.createSubscriber(Irc.topic);
		Irc.topicSubscriber.setMessageListener(new MListener());
      	   } catch (Exception ex) {
		ex.printStackTrace();
	   }
	}
}  
    
    

// action invoked when the "who" button is clicked
class whoListener implements ActionListener {
	public void actionPerformed (ActionEvent ae) {
		try {
			System.out.println("who button pressed");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}


// action invoked when the "leave" button is clicked
class leaveListener implements ActionListener {
	public void actionPerformed (ActionEvent ae) {
		try {
			System.out.println("leave button pressed");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

class MListener implements MessageListener {
	public void onMessage(Message msg)  {
		try {
			Irc.print(((TextMessage)msg).getText());
		} catch(JMSException err) {}
	}
}

