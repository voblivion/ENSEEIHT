package scenario.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.common.util.Enumerator;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import scenario.services.ScenarioGrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class InternalScenarioParser extends AbstractInternalAntlrParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_STRING", "RULE_ID", "RULE_INT", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'Scenario'", "'['", "'-'", "']'", "'Act'", "'Div'", "','", "'Choice'", "'Parallel'"
    };
    public static final int RULE_STRING=4;
    public static final int RULE_SL_COMMENT=8;
    public static final int T__19=19;
    public static final int T__15=15;
    public static final int T__16=16;
    public static final int T__17=17;
    public static final int T__18=18;
    public static final int T__11=11;
    public static final int T__12=12;
    public static final int T__13=13;
    public static final int T__14=14;
    public static final int EOF=-1;
    public static final int RULE_ID=5;
    public static final int RULE_WS=9;
    public static final int RULE_ANY_OTHER=10;
    public static final int RULE_INT=6;
    public static final int RULE_ML_COMMENT=7;

    // delegates
    // delegators


        public InternalScenarioParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public InternalScenarioParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return InternalScenarioParser.tokenNames; }
    public String getGrammarFileName() { return "../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g"; }



     	private ScenarioGrammarAccess grammarAccess;
     	
        public InternalScenarioParser(TokenStream input, ScenarioGrammarAccess grammarAccess) {
            this(input);
            this.grammarAccess = grammarAccess;
            registerRules(grammarAccess.getGrammar());
        }
        
        @Override
        protected String getFirstRuleName() {
        	return "Scenario";	
       	}
       	
       	@Override
       	protected ScenarioGrammarAccess getGrammarAccess() {
       		return grammarAccess;
       	}



    // $ANTLR start "entryRuleScenario"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:68:1: entryRuleScenario returns [EObject current=null] : iv_ruleScenario= ruleScenario EOF ;
    public final EObject entryRuleScenario() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleScenario = null;


        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:69:2: (iv_ruleScenario= ruleScenario EOF )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:70:2: iv_ruleScenario= ruleScenario EOF
            {
             newCompositeNode(grammarAccess.getScenarioRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleScenario_in_entryRuleScenario75);
            iv_ruleScenario=ruleScenario();

            state._fsp--;

             current =iv_ruleScenario; 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleScenario85); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleScenario"


    // $ANTLR start "ruleScenario"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:77:1: ruleScenario returns [EObject current=null] : (otherlv_0= 'Scenario' ( (lv_name_1_0= ruleEString ) ) ( (lv_schedule_2_0= ruleSchedule ) ) ) ;
    public final EObject ruleScenario() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        AntlrDatatypeRuleToken lv_name_1_0 = null;

        EObject lv_schedule_2_0 = null;


         enterRule(); 
            
        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:80:28: ( (otherlv_0= 'Scenario' ( (lv_name_1_0= ruleEString ) ) ( (lv_schedule_2_0= ruleSchedule ) ) ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:81:1: (otherlv_0= 'Scenario' ( (lv_name_1_0= ruleEString ) ) ( (lv_schedule_2_0= ruleSchedule ) ) )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:81:1: (otherlv_0= 'Scenario' ( (lv_name_1_0= ruleEString ) ) ( (lv_schedule_2_0= ruleSchedule ) ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:81:3: otherlv_0= 'Scenario' ( (lv_name_1_0= ruleEString ) ) ( (lv_schedule_2_0= ruleSchedule ) )
            {
            otherlv_0=(Token)match(input,11,FollowSets000.FOLLOW_11_in_ruleScenario122); 

                	newLeafNode(otherlv_0, grammarAccess.getScenarioAccess().getScenarioKeyword_0());
                
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:85:1: ( (lv_name_1_0= ruleEString ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:86:1: (lv_name_1_0= ruleEString )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:86:1: (lv_name_1_0= ruleEString )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:87:3: lv_name_1_0= ruleEString
            {
             
            	        newCompositeNode(grammarAccess.getScenarioAccess().getNameEStringParserRuleCall_1_0()); 
            	    
            pushFollow(FollowSets000.FOLLOW_ruleEString_in_ruleScenario143);
            lv_name_1_0=ruleEString();

            state._fsp--;


            	        if (current==null) {
            	            current = createModelElementForParent(grammarAccess.getScenarioRule());
            	        }
                   		set(
                   			current, 
                   			"name",
                    		lv_name_1_0, 
                    		"EString");
            	        afterParserOrEnumRuleCall();
            	    

            }


            }

            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:103:2: ( (lv_schedule_2_0= ruleSchedule ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:104:1: (lv_schedule_2_0= ruleSchedule )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:104:1: (lv_schedule_2_0= ruleSchedule )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:105:3: lv_schedule_2_0= ruleSchedule
            {
             
            	        newCompositeNode(grammarAccess.getScenarioAccess().getScheduleScheduleParserRuleCall_2_0()); 
            	    
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_ruleScenario164);
            lv_schedule_2_0=ruleSchedule();

            state._fsp--;


            	        if (current==null) {
            	            current = createModelElementForParent(grammarAccess.getScenarioRule());
            	        }
                   		set(
                   			current, 
                   			"schedule",
                    		lv_schedule_2_0, 
                    		"Schedule");
            	        afterParserOrEnumRuleCall();
            	    

            }


            }


            }


            }

             leaveRule(); 
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleScenario"


    // $ANTLR start "entryRuleComponent"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:129:1: entryRuleComponent returns [EObject current=null] : iv_ruleComponent= ruleComponent EOF ;
    public final EObject entryRuleComponent() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleComponent = null;


        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:130:2: (iv_ruleComponent= ruleComponent EOF )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:131:2: iv_ruleComponent= ruleComponent EOF
            {
             newCompositeNode(grammarAccess.getComponentRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleComponent_in_entryRuleComponent200);
            iv_ruleComponent=ruleComponent();

            state._fsp--;

             current =iv_ruleComponent; 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleComponent210); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleComponent"


    // $ANTLR start "ruleComponent"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:138:1: ruleComponent returns [EObject current=null] : (this_Activity_0= ruleActivity | this_Divergence_1= ruleDivergence ) ;
    public final EObject ruleComponent() throws RecognitionException {
        EObject current = null;

        EObject this_Activity_0 = null;

        EObject this_Divergence_1 = null;


         enterRule(); 
            
        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:141:28: ( (this_Activity_0= ruleActivity | this_Divergence_1= ruleDivergence ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:142:1: (this_Activity_0= ruleActivity | this_Divergence_1= ruleDivergence )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:142:1: (this_Activity_0= ruleActivity | this_Divergence_1= ruleDivergence )
            int alt1=2;
            int LA1_0 = input.LA(1);

            if ( (LA1_0==15) ) {
                alt1=1;
            }
            else if ( (LA1_0==16) ) {
                alt1=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:143:5: this_Activity_0= ruleActivity
                    {
                     
                            newCompositeNode(grammarAccess.getComponentAccess().getActivityParserRuleCall_0()); 
                        
                    pushFollow(FollowSets000.FOLLOW_ruleActivity_in_ruleComponent257);
                    this_Activity_0=ruleActivity();

                    state._fsp--;

                     
                            current = this_Activity_0; 
                            afterParserOrEnumRuleCall();
                        

                    }
                    break;
                case 2 :
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:153:5: this_Divergence_1= ruleDivergence
                    {
                     
                            newCompositeNode(grammarAccess.getComponentAccess().getDivergenceParserRuleCall_1()); 
                        
                    pushFollow(FollowSets000.FOLLOW_ruleDivergence_in_ruleComponent284);
                    this_Divergence_1=ruleDivergence();

                    state._fsp--;

                     
                            current = this_Divergence_1; 
                            afterParserOrEnumRuleCall();
                        

                    }
                    break;

            }


            }

             leaveRule(); 
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleComponent"


    // $ANTLR start "entryRuleEString"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:169:1: entryRuleEString returns [String current=null] : iv_ruleEString= ruleEString EOF ;
    public final String entryRuleEString() throws RecognitionException {
        String current = null;

        AntlrDatatypeRuleToken iv_ruleEString = null;


        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:170:2: (iv_ruleEString= ruleEString EOF )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:171:2: iv_ruleEString= ruleEString EOF
            {
             newCompositeNode(grammarAccess.getEStringRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleEString_in_entryRuleEString320);
            iv_ruleEString=ruleEString();

            state._fsp--;

             current =iv_ruleEString.getText(); 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleEString331); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleEString"


    // $ANTLR start "ruleEString"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:178:1: ruleEString returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] : (this_STRING_0= RULE_STRING | this_ID_1= RULE_ID ) ;
    public final AntlrDatatypeRuleToken ruleEString() throws RecognitionException {
        AntlrDatatypeRuleToken current = new AntlrDatatypeRuleToken();

        Token this_STRING_0=null;
        Token this_ID_1=null;

         enterRule(); 
            
        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:181:28: ( (this_STRING_0= RULE_STRING | this_ID_1= RULE_ID ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:182:1: (this_STRING_0= RULE_STRING | this_ID_1= RULE_ID )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:182:1: (this_STRING_0= RULE_STRING | this_ID_1= RULE_ID )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==RULE_STRING) ) {
                alt2=1;
            }
            else if ( (LA2_0==RULE_ID) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:182:6: this_STRING_0= RULE_STRING
                    {
                    this_STRING_0=(Token)match(input,RULE_STRING,FollowSets000.FOLLOW_RULE_STRING_in_ruleEString371); 

                    		current.merge(this_STRING_0);
                        
                     
                        newLeafNode(this_STRING_0, grammarAccess.getEStringAccess().getSTRINGTerminalRuleCall_0()); 
                        

                    }
                    break;
                case 2 :
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:190:10: this_ID_1= RULE_ID
                    {
                    this_ID_1=(Token)match(input,RULE_ID,FollowSets000.FOLLOW_RULE_ID_in_ruleEString397); 

                    		current.merge(this_ID_1);
                        
                     
                        newLeafNode(this_ID_1, grammarAccess.getEStringAccess().getIDTerminalRuleCall_1()); 
                        

                    }
                    break;

            }


            }

             leaveRule(); 
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleEString"


    // $ANTLR start "entryRuleSchedule"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:205:1: entryRuleSchedule returns [EObject current=null] : iv_ruleSchedule= ruleSchedule EOF ;
    public final EObject entryRuleSchedule() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleSchedule = null;


        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:206:2: (iv_ruleSchedule= ruleSchedule EOF )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:207:2: iv_ruleSchedule= ruleSchedule EOF
            {
             newCompositeNode(grammarAccess.getScheduleRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_entryRuleSchedule442);
            iv_ruleSchedule=ruleSchedule();

            state._fsp--;

             current =iv_ruleSchedule; 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleSchedule452); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleSchedule"


    // $ANTLR start "ruleSchedule"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:214:1: ruleSchedule returns [EObject current=null] : (otherlv_0= '[' otherlv_1= '-' ( (lv_components_2_0= ruleComponent ) ) (otherlv_3= '-' ( (lv_components_4_0= ruleComponent ) ) )* otherlv_5= ']' ) ;
    public final EObject ruleSchedule() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token otherlv_1=null;
        Token otherlv_3=null;
        Token otherlv_5=null;
        EObject lv_components_2_0 = null;

        EObject lv_components_4_0 = null;


         enterRule(); 
            
        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:217:28: ( (otherlv_0= '[' otherlv_1= '-' ( (lv_components_2_0= ruleComponent ) ) (otherlv_3= '-' ( (lv_components_4_0= ruleComponent ) ) )* otherlv_5= ']' ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:218:1: (otherlv_0= '[' otherlv_1= '-' ( (lv_components_2_0= ruleComponent ) ) (otherlv_3= '-' ( (lv_components_4_0= ruleComponent ) ) )* otherlv_5= ']' )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:218:1: (otherlv_0= '[' otherlv_1= '-' ( (lv_components_2_0= ruleComponent ) ) (otherlv_3= '-' ( (lv_components_4_0= ruleComponent ) ) )* otherlv_5= ']' )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:218:3: otherlv_0= '[' otherlv_1= '-' ( (lv_components_2_0= ruleComponent ) ) (otherlv_3= '-' ( (lv_components_4_0= ruleComponent ) ) )* otherlv_5= ']'
            {
            otherlv_0=(Token)match(input,12,FollowSets000.FOLLOW_12_in_ruleSchedule489); 

                	newLeafNode(otherlv_0, grammarAccess.getScheduleAccess().getLeftSquareBracketKeyword_0());
                
            otherlv_1=(Token)match(input,13,FollowSets000.FOLLOW_13_in_ruleSchedule501); 

                	newLeafNode(otherlv_1, grammarAccess.getScheduleAccess().getHyphenMinusKeyword_1());
                
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:226:1: ( (lv_components_2_0= ruleComponent ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:227:1: (lv_components_2_0= ruleComponent )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:227:1: (lv_components_2_0= ruleComponent )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:228:3: lv_components_2_0= ruleComponent
            {
             
            	        newCompositeNode(grammarAccess.getScheduleAccess().getComponentsComponentParserRuleCall_2_0()); 
            	    
            pushFollow(FollowSets000.FOLLOW_ruleComponent_in_ruleSchedule522);
            lv_components_2_0=ruleComponent();

            state._fsp--;


            	        if (current==null) {
            	            current = createModelElementForParent(grammarAccess.getScheduleRule());
            	        }
                   		add(
                   			current, 
                   			"components",
                    		lv_components_2_0, 
                    		"Component");
            	        afterParserOrEnumRuleCall();
            	    

            }


            }

            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:244:2: (otherlv_3= '-' ( (lv_components_4_0= ruleComponent ) ) )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( (LA3_0==13) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:244:4: otherlv_3= '-' ( (lv_components_4_0= ruleComponent ) )
            	    {
            	    otherlv_3=(Token)match(input,13,FollowSets000.FOLLOW_13_in_ruleSchedule535); 

            	        	newLeafNode(otherlv_3, grammarAccess.getScheduleAccess().getHyphenMinusKeyword_3_0());
            	        
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:248:1: ( (lv_components_4_0= ruleComponent ) )
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:249:1: (lv_components_4_0= ruleComponent )
            	    {
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:249:1: (lv_components_4_0= ruleComponent )
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:250:3: lv_components_4_0= ruleComponent
            	    {
            	     
            	    	        newCompositeNode(grammarAccess.getScheduleAccess().getComponentsComponentParserRuleCall_3_1_0()); 
            	    	    
            	    pushFollow(FollowSets000.FOLLOW_ruleComponent_in_ruleSchedule556);
            	    lv_components_4_0=ruleComponent();

            	    state._fsp--;


            	    	        if (current==null) {
            	    	            current = createModelElementForParent(grammarAccess.getScheduleRule());
            	    	        }
            	           		add(
            	           			current, 
            	           			"components",
            	            		lv_components_4_0, 
            	            		"Component");
            	    	        afterParserOrEnumRuleCall();
            	    	    

            	    }


            	    }


            	    }
            	    break;

            	default :
            	    break loop3;
                }
            } while (true);

            otherlv_5=(Token)match(input,14,FollowSets000.FOLLOW_14_in_ruleSchedule570); 

                	newLeafNode(otherlv_5, grammarAccess.getScheduleAccess().getRightSquareBracketKeyword_4());
                

            }


            }

             leaveRule(); 
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleSchedule"


    // $ANTLR start "entryRuleActivity"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:278:1: entryRuleActivity returns [EObject current=null] : iv_ruleActivity= ruleActivity EOF ;
    public final EObject entryRuleActivity() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleActivity = null;


        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:279:2: (iv_ruleActivity= ruleActivity EOF )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:280:2: iv_ruleActivity= ruleActivity EOF
            {
             newCompositeNode(grammarAccess.getActivityRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleActivity_in_entryRuleActivity606);
            iv_ruleActivity=ruleActivity();

            state._fsp--;

             current =iv_ruleActivity; 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleActivity616); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleActivity"


    // $ANTLR start "ruleActivity"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:287:1: ruleActivity returns [EObject current=null] : ( () otherlv_1= 'Act' ( (lv_name_2_0= ruleEString ) ) ( (lv_schedule_3_0= ruleSchedule ) )? ) ;
    public final EObject ruleActivity() throws RecognitionException {
        EObject current = null;

        Token otherlv_1=null;
        AntlrDatatypeRuleToken lv_name_2_0 = null;

        EObject lv_schedule_3_0 = null;


         enterRule(); 
            
        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:290:28: ( ( () otherlv_1= 'Act' ( (lv_name_2_0= ruleEString ) ) ( (lv_schedule_3_0= ruleSchedule ) )? ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:291:1: ( () otherlv_1= 'Act' ( (lv_name_2_0= ruleEString ) ) ( (lv_schedule_3_0= ruleSchedule ) )? )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:291:1: ( () otherlv_1= 'Act' ( (lv_name_2_0= ruleEString ) ) ( (lv_schedule_3_0= ruleSchedule ) )? )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:291:2: () otherlv_1= 'Act' ( (lv_name_2_0= ruleEString ) ) ( (lv_schedule_3_0= ruleSchedule ) )?
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:291:2: ()
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:292:5: 
            {

                    current = forceCreateModelElement(
                        grammarAccess.getActivityAccess().getActivityAction_0(),
                        current);
                

            }

            otherlv_1=(Token)match(input,15,FollowSets000.FOLLOW_15_in_ruleActivity662); 

                	newLeafNode(otherlv_1, grammarAccess.getActivityAccess().getActKeyword_1());
                
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:301:1: ( (lv_name_2_0= ruleEString ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:302:1: (lv_name_2_0= ruleEString )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:302:1: (lv_name_2_0= ruleEString )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:303:3: lv_name_2_0= ruleEString
            {
             
            	        newCompositeNode(grammarAccess.getActivityAccess().getNameEStringParserRuleCall_2_0()); 
            	    
            pushFollow(FollowSets000.FOLLOW_ruleEString_in_ruleActivity683);
            lv_name_2_0=ruleEString();

            state._fsp--;


            	        if (current==null) {
            	            current = createModelElementForParent(grammarAccess.getActivityRule());
            	        }
                   		set(
                   			current, 
                   			"name",
                    		lv_name_2_0, 
                    		"EString");
            	        afterParserOrEnumRuleCall();
            	    

            }


            }

            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:319:2: ( (lv_schedule_3_0= ruleSchedule ) )?
            int alt4=2;
            int LA4_0 = input.LA(1);

            if ( (LA4_0==12) ) {
                alt4=1;
            }
            switch (alt4) {
                case 1 :
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:320:1: (lv_schedule_3_0= ruleSchedule )
                    {
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:320:1: (lv_schedule_3_0= ruleSchedule )
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:321:3: lv_schedule_3_0= ruleSchedule
                    {
                     
                    	        newCompositeNode(grammarAccess.getActivityAccess().getScheduleScheduleParserRuleCall_3_0()); 
                    	    
                    pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_ruleActivity704);
                    lv_schedule_3_0=ruleSchedule();

                    state._fsp--;


                    	        if (current==null) {
                    	            current = createModelElementForParent(grammarAccess.getActivityRule());
                    	        }
                           		set(
                           			current, 
                           			"schedule",
                            		lv_schedule_3_0, 
                            		"Schedule");
                    	        afterParserOrEnumRuleCall();
                    	    

                    }


                    }
                    break;

            }


            }


            }

             leaveRule(); 
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleActivity"


    // $ANTLR start "entryRuleDivergence"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:345:1: entryRuleDivergence returns [EObject current=null] : iv_ruleDivergence= ruleDivergence EOF ;
    public final EObject entryRuleDivergence() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleDivergence = null;


        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:346:2: (iv_ruleDivergence= ruleDivergence EOF )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:347:2: iv_ruleDivergence= ruleDivergence EOF
            {
             newCompositeNode(grammarAccess.getDivergenceRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleDivergence_in_entryRuleDivergence741);
            iv_ruleDivergence=ruleDivergence();

            state._fsp--;

             current =iv_ruleDivergence; 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleDivergence751); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleDivergence"


    // $ANTLR start "ruleDivergence"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:354:1: ruleDivergence returns [EObject current=null] : (otherlv_0= 'Div' ( (lv_type_1_0= ruleDivergenceType ) ) otherlv_2= '[' ( (lv_schedules_3_0= ruleSchedule ) ) (otherlv_4= ',' ( (lv_schedules_5_0= ruleSchedule ) ) )* otherlv_6= ']' ) ;
    public final EObject ruleDivergence() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token otherlv_2=null;
        Token otherlv_4=null;
        Token otherlv_6=null;
        Enumerator lv_type_1_0 = null;

        EObject lv_schedules_3_0 = null;

        EObject lv_schedules_5_0 = null;


         enterRule(); 
            
        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:357:28: ( (otherlv_0= 'Div' ( (lv_type_1_0= ruleDivergenceType ) ) otherlv_2= '[' ( (lv_schedules_3_0= ruleSchedule ) ) (otherlv_4= ',' ( (lv_schedules_5_0= ruleSchedule ) ) )* otherlv_6= ']' ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:358:1: (otherlv_0= 'Div' ( (lv_type_1_0= ruleDivergenceType ) ) otherlv_2= '[' ( (lv_schedules_3_0= ruleSchedule ) ) (otherlv_4= ',' ( (lv_schedules_5_0= ruleSchedule ) ) )* otherlv_6= ']' )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:358:1: (otherlv_0= 'Div' ( (lv_type_1_0= ruleDivergenceType ) ) otherlv_2= '[' ( (lv_schedules_3_0= ruleSchedule ) ) (otherlv_4= ',' ( (lv_schedules_5_0= ruleSchedule ) ) )* otherlv_6= ']' )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:358:3: otherlv_0= 'Div' ( (lv_type_1_0= ruleDivergenceType ) ) otherlv_2= '[' ( (lv_schedules_3_0= ruleSchedule ) ) (otherlv_4= ',' ( (lv_schedules_5_0= ruleSchedule ) ) )* otherlv_6= ']'
            {
            otherlv_0=(Token)match(input,16,FollowSets000.FOLLOW_16_in_ruleDivergence788); 

                	newLeafNode(otherlv_0, grammarAccess.getDivergenceAccess().getDivKeyword_0());
                
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:362:1: ( (lv_type_1_0= ruleDivergenceType ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:363:1: (lv_type_1_0= ruleDivergenceType )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:363:1: (lv_type_1_0= ruleDivergenceType )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:364:3: lv_type_1_0= ruleDivergenceType
            {
             
            	        newCompositeNode(grammarAccess.getDivergenceAccess().getTypeDivergenceTypeEnumRuleCall_1_0()); 
            	    
            pushFollow(FollowSets000.FOLLOW_ruleDivergenceType_in_ruleDivergence809);
            lv_type_1_0=ruleDivergenceType();

            state._fsp--;


            	        if (current==null) {
            	            current = createModelElementForParent(grammarAccess.getDivergenceRule());
            	        }
                   		set(
                   			current, 
                   			"type",
                    		lv_type_1_0, 
                    		"DivergenceType");
            	        afterParserOrEnumRuleCall();
            	    

            }


            }

            otherlv_2=(Token)match(input,12,FollowSets000.FOLLOW_12_in_ruleDivergence821); 

                	newLeafNode(otherlv_2, grammarAccess.getDivergenceAccess().getLeftSquareBracketKeyword_2());
                
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:384:1: ( (lv_schedules_3_0= ruleSchedule ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:385:1: (lv_schedules_3_0= ruleSchedule )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:385:1: (lv_schedules_3_0= ruleSchedule )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:386:3: lv_schedules_3_0= ruleSchedule
            {
             
            	        newCompositeNode(grammarAccess.getDivergenceAccess().getSchedulesScheduleParserRuleCall_3_0()); 
            	    
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_ruleDivergence842);
            lv_schedules_3_0=ruleSchedule();

            state._fsp--;


            	        if (current==null) {
            	            current = createModelElementForParent(grammarAccess.getDivergenceRule());
            	        }
                   		add(
                   			current, 
                   			"schedules",
                    		lv_schedules_3_0, 
                    		"Schedule");
            	        afterParserOrEnumRuleCall();
            	    

            }


            }

            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:402:2: (otherlv_4= ',' ( (lv_schedules_5_0= ruleSchedule ) ) )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);

                if ( (LA5_0==17) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:402:4: otherlv_4= ',' ( (lv_schedules_5_0= ruleSchedule ) )
            	    {
            	    otherlv_4=(Token)match(input,17,FollowSets000.FOLLOW_17_in_ruleDivergence855); 

            	        	newLeafNode(otherlv_4, grammarAccess.getDivergenceAccess().getCommaKeyword_4_0());
            	        
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:406:1: ( (lv_schedules_5_0= ruleSchedule ) )
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:407:1: (lv_schedules_5_0= ruleSchedule )
            	    {
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:407:1: (lv_schedules_5_0= ruleSchedule )
            	    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:408:3: lv_schedules_5_0= ruleSchedule
            	    {
            	     
            	    	        newCompositeNode(grammarAccess.getDivergenceAccess().getSchedulesScheduleParserRuleCall_4_1_0()); 
            	    	    
            	    pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_ruleDivergence876);
            	    lv_schedules_5_0=ruleSchedule();

            	    state._fsp--;


            	    	        if (current==null) {
            	    	            current = createModelElementForParent(grammarAccess.getDivergenceRule());
            	    	        }
            	           		add(
            	           			current, 
            	           			"schedules",
            	            		lv_schedules_5_0, 
            	            		"Schedule");
            	    	        afterParserOrEnumRuleCall();
            	    	    

            	    }


            	    }


            	    }
            	    break;

            	default :
            	    break loop5;
                }
            } while (true);

            otherlv_6=(Token)match(input,14,FollowSets000.FOLLOW_14_in_ruleDivergence890); 

                	newLeafNode(otherlv_6, grammarAccess.getDivergenceAccess().getRightSquareBracketKeyword_5());
                

            }


            }

             leaveRule(); 
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleDivergence"


    // $ANTLR start "ruleDivergenceType"
    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:436:1: ruleDivergenceType returns [Enumerator current=null] : ( (enumLiteral_0= 'Choice' ) | (enumLiteral_1= 'Parallel' ) ) ;
    public final Enumerator ruleDivergenceType() throws RecognitionException {
        Enumerator current = null;

        Token enumLiteral_0=null;
        Token enumLiteral_1=null;

         enterRule(); 
        try {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:438:28: ( ( (enumLiteral_0= 'Choice' ) | (enumLiteral_1= 'Parallel' ) ) )
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:439:1: ( (enumLiteral_0= 'Choice' ) | (enumLiteral_1= 'Parallel' ) )
            {
            // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:439:1: ( (enumLiteral_0= 'Choice' ) | (enumLiteral_1= 'Parallel' ) )
            int alt6=2;
            int LA6_0 = input.LA(1);

            if ( (LA6_0==18) ) {
                alt6=1;
            }
            else if ( (LA6_0==19) ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:439:2: (enumLiteral_0= 'Choice' )
                    {
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:439:2: (enumLiteral_0= 'Choice' )
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:439:4: enumLiteral_0= 'Choice'
                    {
                    enumLiteral_0=(Token)match(input,18,FollowSets000.FOLLOW_18_in_ruleDivergenceType940); 

                            current = grammarAccess.getDivergenceTypeAccess().getChoiceEnumLiteralDeclaration_0().getEnumLiteral().getInstance();
                            newLeafNode(enumLiteral_0, grammarAccess.getDivergenceTypeAccess().getChoiceEnumLiteralDeclaration_0()); 
                        

                    }


                    }
                    break;
                case 2 :
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:445:6: (enumLiteral_1= 'Parallel' )
                    {
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:445:6: (enumLiteral_1= 'Parallel' )
                    // ../scenario.xtext2/src-gen/scenario/parser/antlr/internal/InternalScenario.g:445:8: enumLiteral_1= 'Parallel'
                    {
                    enumLiteral_1=(Token)match(input,19,FollowSets000.FOLLOW_19_in_ruleDivergenceType957); 

                            current = grammarAccess.getDivergenceTypeAccess().getParallelEnumLiteralDeclaration_1().getEnumLiteral().getInstance();
                            newLeafNode(enumLiteral_1, grammarAccess.getDivergenceTypeAccess().getParallelEnumLiteralDeclaration_1()); 
                        

                    }


                    }
                    break;

            }


            }

             leaveRule(); 
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleDivergenceType"

    // Delegated rules


 

    
    private static class FollowSets000 {
        public static final BitSet FOLLOW_ruleScenario_in_entryRuleScenario75 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleScenario85 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_11_in_ruleScenario122 = new BitSet(new long[]{0x0000000000000030L});
        public static final BitSet FOLLOW_ruleEString_in_ruleScenario143 = new BitSet(new long[]{0x0000000000001000L});
        public static final BitSet FOLLOW_ruleSchedule_in_ruleScenario164 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleComponent_in_entryRuleComponent200 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleComponent210 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleActivity_in_ruleComponent257 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleDivergence_in_ruleComponent284 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleEString_in_entryRuleEString320 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleEString331 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_RULE_STRING_in_ruleEString371 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_RULE_ID_in_ruleEString397 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleSchedule_in_entryRuleSchedule442 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleSchedule452 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_12_in_ruleSchedule489 = new BitSet(new long[]{0x0000000000002000L});
        public static final BitSet FOLLOW_13_in_ruleSchedule501 = new BitSet(new long[]{0x0000000000018000L});
        public static final BitSet FOLLOW_ruleComponent_in_ruleSchedule522 = new BitSet(new long[]{0x0000000000006000L});
        public static final BitSet FOLLOW_13_in_ruleSchedule535 = new BitSet(new long[]{0x0000000000018000L});
        public static final BitSet FOLLOW_ruleComponent_in_ruleSchedule556 = new BitSet(new long[]{0x0000000000006000L});
        public static final BitSet FOLLOW_14_in_ruleSchedule570 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleActivity_in_entryRuleActivity606 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleActivity616 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_15_in_ruleActivity662 = new BitSet(new long[]{0x0000000000000030L});
        public static final BitSet FOLLOW_ruleEString_in_ruleActivity683 = new BitSet(new long[]{0x0000000000001002L});
        public static final BitSet FOLLOW_ruleSchedule_in_ruleActivity704 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleDivergence_in_entryRuleDivergence741 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleDivergence751 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_16_in_ruleDivergence788 = new BitSet(new long[]{0x00000000000C0000L});
        public static final BitSet FOLLOW_ruleDivergenceType_in_ruleDivergence809 = new BitSet(new long[]{0x0000000000001000L});
        public static final BitSet FOLLOW_12_in_ruleDivergence821 = new BitSet(new long[]{0x0000000000001000L});
        public static final BitSet FOLLOW_ruleSchedule_in_ruleDivergence842 = new BitSet(new long[]{0x0000000000024000L});
        public static final BitSet FOLLOW_17_in_ruleDivergence855 = new BitSet(new long[]{0x0000000000001000L});
        public static final BitSet FOLLOW_ruleSchedule_in_ruleDivergence876 = new BitSet(new long[]{0x0000000000024000L});
        public static final BitSet FOLLOW_14_in_ruleDivergence890 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_18_in_ruleDivergenceType940 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_19_in_ruleDivergenceType957 = new BitSet(new long[]{0x0000000000000002L});
    }


}