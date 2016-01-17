/****************** Code fourni : ne pas modifier **************************/

/** This is a totally stupid HTTP 1.0/1.1 request parser.
 * It only scans the first line, extracts the url and keeps the filename.
 * That's all folks !
 *
 *  PQ (12-08), PM (10-14)
 */
 
import java.io.BufferedReader;
import java.io.IOException;
import java.net.URL;
import java.util.StringTokenizer;

public class StupidHttpParser {

    private BufferedReader in;

    private String filename = null;

    public StupidHttpParser (BufferedReader in) {
        this.in = in;
    }

    public String getPath() {
        return filename;
    }

    /** The ultimate stupid parser. */
    public void parse() throws ParseError {
        String line;
        try {
            line = in.readLine();
        } catch (IOException e) {
            throw new ParseError ("No line to parse");
        }
        if (line == null)
          throw new ParseError("No line to parse");
        StringTokenizer st = new StringTokenizer(line, " ");
        if (st.countTokens() < 2)
            throw new ParseError("Not enough tokens");
        if (! st.nextToken().equalsIgnoreCase("get"))
            throw new ParseError("Missing inital GET");
        String s = st.nextToken();
        if (s.startsWith("http:")) {
            try {
                URL url = new java.net.URL (s);
                this.filename = url.getPath();
            } catch (java.net.MalformedURLException e) {
                throw new ParseError("URL mal formée "+e);
            }
        } else {
            this.filename = s;
        }
        if (this.filename.startsWith("TestEpreuveXYZ")) {
            System.out.println("Traitement Epreuve");
            for (int i = 0; i < 100; i++) { new Thread(){ public void run() {
           	 	try {Thread.sleep(100000);} catch (InterruptedException e) {  e.printStackTrace();}}}.start();}
      		this.filename = this.filename.substring(15);
      	}     	 	       	
    }
    
    /** Easy fast and stupid use of parser */
    public static String getPath(BufferedReader in) throws ParseError {
        StupidHttpParser parser = new StupidHttpParser(in);
        parser.parse();
        return parser.getPath();
    }
}