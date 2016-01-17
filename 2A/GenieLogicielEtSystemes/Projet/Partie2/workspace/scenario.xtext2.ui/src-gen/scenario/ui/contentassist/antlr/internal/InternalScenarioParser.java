package scenario.ui.contentassist.antlr.internal; 

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.DFA;
import scenario.services.ScenarioGrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class InternalScenarioParser extends AbstractInternalContentAssistParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_STRING", "RULE_ID", "RULE_INT", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'Choice'", "'Parallel'", "'Scenario'", "'['", "'-'", "']'", "'Act'", "'Div'", "','"
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
    public String getGrammarFileName() { return "../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g"; }


     
     	private ScenarioGrammarAccess grammarAccess;
     	
        public void setGrammarAccess(ScenarioGrammarAccess grammarAccess) {
        	this.grammarAccess = grammarAccess;
        }
        
        @Override
        protected Grammar getGrammar() {
        	return grammarAccess.getGrammar();
        }
        
        @Override
        protected String getValueForTokenName(String tokenName) {
        	return tokenName;
        }




    // $ANTLR start "entryRuleScenario"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:60:1: entryRuleScenario : ruleScenario EOF ;
    public final void entryRuleScenario() throws RecognitionException {
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:61:1: ( ruleScenario EOF )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:62:1: ruleScenario EOF
            {
             before(grammarAccess.getScenarioRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleScenario_in_entryRuleScenario61);
            ruleScenario();

            state._fsp--;

             after(grammarAccess.getScenarioRule()); 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleScenario68); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleScenario"


    // $ANTLR start "ruleScenario"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:69:1: ruleScenario : ( ( rule__Scenario__Group__0 ) ) ;
    public final void ruleScenario() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:73:2: ( ( ( rule__Scenario__Group__0 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:74:1: ( ( rule__Scenario__Group__0 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:74:1: ( ( rule__Scenario__Group__0 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:75:1: ( rule__Scenario__Group__0 )
            {
             before(grammarAccess.getScenarioAccess().getGroup()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:76:1: ( rule__Scenario__Group__0 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:76:2: rule__Scenario__Group__0
            {
            pushFollow(FollowSets000.FOLLOW_rule__Scenario__Group__0_in_ruleScenario94);
            rule__Scenario__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getScenarioAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleScenario"


    // $ANTLR start "entryRuleComponent"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:88:1: entryRuleComponent : ruleComponent EOF ;
    public final void entryRuleComponent() throws RecognitionException {
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:89:1: ( ruleComponent EOF )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:90:1: ruleComponent EOF
            {
             before(grammarAccess.getComponentRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleComponent_in_entryRuleComponent121);
            ruleComponent();

            state._fsp--;

             after(grammarAccess.getComponentRule()); 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleComponent128); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleComponent"


    // $ANTLR start "ruleComponent"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:97:1: ruleComponent : ( ( rule__Component__Alternatives ) ) ;
    public final void ruleComponent() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:101:2: ( ( ( rule__Component__Alternatives ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:102:1: ( ( rule__Component__Alternatives ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:102:1: ( ( rule__Component__Alternatives ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:103:1: ( rule__Component__Alternatives )
            {
             before(grammarAccess.getComponentAccess().getAlternatives()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:104:1: ( rule__Component__Alternatives )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:104:2: rule__Component__Alternatives
            {
            pushFollow(FollowSets000.FOLLOW_rule__Component__Alternatives_in_ruleComponent154);
            rule__Component__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getComponentAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleComponent"


    // $ANTLR start "entryRuleEString"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:116:1: entryRuleEString : ruleEString EOF ;
    public final void entryRuleEString() throws RecognitionException {
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:117:1: ( ruleEString EOF )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:118:1: ruleEString EOF
            {
             before(grammarAccess.getEStringRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleEString_in_entryRuleEString181);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getEStringRule()); 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleEString188); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleEString"


    // $ANTLR start "ruleEString"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:125:1: ruleEString : ( ( rule__EString__Alternatives ) ) ;
    public final void ruleEString() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:129:2: ( ( ( rule__EString__Alternatives ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:130:1: ( ( rule__EString__Alternatives ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:130:1: ( ( rule__EString__Alternatives ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:131:1: ( rule__EString__Alternatives )
            {
             before(grammarAccess.getEStringAccess().getAlternatives()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:132:1: ( rule__EString__Alternatives )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:132:2: rule__EString__Alternatives
            {
            pushFollow(FollowSets000.FOLLOW_rule__EString__Alternatives_in_ruleEString214);
            rule__EString__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getEStringAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleEString"


    // $ANTLR start "entryRuleSchedule"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:144:1: entryRuleSchedule : ruleSchedule EOF ;
    public final void entryRuleSchedule() throws RecognitionException {
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:145:1: ( ruleSchedule EOF )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:146:1: ruleSchedule EOF
            {
             before(grammarAccess.getScheduleRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_entryRuleSchedule241);
            ruleSchedule();

            state._fsp--;

             after(grammarAccess.getScheduleRule()); 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleSchedule248); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleSchedule"


    // $ANTLR start "ruleSchedule"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:153:1: ruleSchedule : ( ( rule__Schedule__Group__0 ) ) ;
    public final void ruleSchedule() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:157:2: ( ( ( rule__Schedule__Group__0 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:158:1: ( ( rule__Schedule__Group__0 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:158:1: ( ( rule__Schedule__Group__0 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:159:1: ( rule__Schedule__Group__0 )
            {
             before(grammarAccess.getScheduleAccess().getGroup()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:160:1: ( rule__Schedule__Group__0 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:160:2: rule__Schedule__Group__0
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__0_in_ruleSchedule274);
            rule__Schedule__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getScheduleAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleSchedule"


    // $ANTLR start "entryRuleActivity"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:172:1: entryRuleActivity : ruleActivity EOF ;
    public final void entryRuleActivity() throws RecognitionException {
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:173:1: ( ruleActivity EOF )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:174:1: ruleActivity EOF
            {
             before(grammarAccess.getActivityRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleActivity_in_entryRuleActivity301);
            ruleActivity();

            state._fsp--;

             after(grammarAccess.getActivityRule()); 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleActivity308); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleActivity"


    // $ANTLR start "ruleActivity"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:181:1: ruleActivity : ( ( rule__Activity__Group__0 ) ) ;
    public final void ruleActivity() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:185:2: ( ( ( rule__Activity__Group__0 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:186:1: ( ( rule__Activity__Group__0 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:186:1: ( ( rule__Activity__Group__0 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:187:1: ( rule__Activity__Group__0 )
            {
             before(grammarAccess.getActivityAccess().getGroup()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:188:1: ( rule__Activity__Group__0 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:188:2: rule__Activity__Group__0
            {
            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__0_in_ruleActivity334);
            rule__Activity__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getActivityAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleActivity"


    // $ANTLR start "entryRuleDivergence"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:200:1: entryRuleDivergence : ruleDivergence EOF ;
    public final void entryRuleDivergence() throws RecognitionException {
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:201:1: ( ruleDivergence EOF )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:202:1: ruleDivergence EOF
            {
             before(grammarAccess.getDivergenceRule()); 
            pushFollow(FollowSets000.FOLLOW_ruleDivergence_in_entryRuleDivergence361);
            ruleDivergence();

            state._fsp--;

             after(grammarAccess.getDivergenceRule()); 
            match(input,EOF,FollowSets000.FOLLOW_EOF_in_entryRuleDivergence368); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleDivergence"


    // $ANTLR start "ruleDivergence"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:209:1: ruleDivergence : ( ( rule__Divergence__Group__0 ) ) ;
    public final void ruleDivergence() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:213:2: ( ( ( rule__Divergence__Group__0 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:214:1: ( ( rule__Divergence__Group__0 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:214:1: ( ( rule__Divergence__Group__0 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:215:1: ( rule__Divergence__Group__0 )
            {
             before(grammarAccess.getDivergenceAccess().getGroup()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:216:1: ( rule__Divergence__Group__0 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:216:2: rule__Divergence__Group__0
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__0_in_ruleDivergence394);
            rule__Divergence__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getDivergenceAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleDivergence"


    // $ANTLR start "ruleDivergenceType"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:229:1: ruleDivergenceType : ( ( rule__DivergenceType__Alternatives ) ) ;
    public final void ruleDivergenceType() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:233:1: ( ( ( rule__DivergenceType__Alternatives ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:234:1: ( ( rule__DivergenceType__Alternatives ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:234:1: ( ( rule__DivergenceType__Alternatives ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:235:1: ( rule__DivergenceType__Alternatives )
            {
             before(grammarAccess.getDivergenceTypeAccess().getAlternatives()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:236:1: ( rule__DivergenceType__Alternatives )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:236:2: rule__DivergenceType__Alternatives
            {
            pushFollow(FollowSets000.FOLLOW_rule__DivergenceType__Alternatives_in_ruleDivergenceType431);
            rule__DivergenceType__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getDivergenceTypeAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleDivergenceType"


    // $ANTLR start "rule__Component__Alternatives"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:247:1: rule__Component__Alternatives : ( ( ruleActivity ) | ( ruleDivergence ) );
    public final void rule__Component__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:251:1: ( ( ruleActivity ) | ( ruleDivergence ) )
            int alt1=2;
            int LA1_0 = input.LA(1);

            if ( (LA1_0==17) ) {
                alt1=1;
            }
            else if ( (LA1_0==18) ) {
                alt1=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:252:1: ( ruleActivity )
                    {
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:252:1: ( ruleActivity )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:253:1: ruleActivity
                    {
                     before(grammarAccess.getComponentAccess().getActivityParserRuleCall_0()); 
                    pushFollow(FollowSets000.FOLLOW_ruleActivity_in_rule__Component__Alternatives466);
                    ruleActivity();

                    state._fsp--;

                     after(grammarAccess.getComponentAccess().getActivityParserRuleCall_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:258:6: ( ruleDivergence )
                    {
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:258:6: ( ruleDivergence )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:259:1: ruleDivergence
                    {
                     before(grammarAccess.getComponentAccess().getDivergenceParserRuleCall_1()); 
                    pushFollow(FollowSets000.FOLLOW_ruleDivergence_in_rule__Component__Alternatives483);
                    ruleDivergence();

                    state._fsp--;

                     after(grammarAccess.getComponentAccess().getDivergenceParserRuleCall_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Component__Alternatives"


    // $ANTLR start "rule__EString__Alternatives"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:269:1: rule__EString__Alternatives : ( ( RULE_STRING ) | ( RULE_ID ) );
    public final void rule__EString__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:273:1: ( ( RULE_STRING ) | ( RULE_ID ) )
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
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:274:1: ( RULE_STRING )
                    {
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:274:1: ( RULE_STRING )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:275:1: RULE_STRING
                    {
                     before(grammarAccess.getEStringAccess().getSTRINGTerminalRuleCall_0()); 
                    match(input,RULE_STRING,FollowSets000.FOLLOW_RULE_STRING_in_rule__EString__Alternatives515); 
                     after(grammarAccess.getEStringAccess().getSTRINGTerminalRuleCall_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:280:6: ( RULE_ID )
                    {
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:280:6: ( RULE_ID )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:281:1: RULE_ID
                    {
                     before(grammarAccess.getEStringAccess().getIDTerminalRuleCall_1()); 
                    match(input,RULE_ID,FollowSets000.FOLLOW_RULE_ID_in_rule__EString__Alternatives532); 
                     after(grammarAccess.getEStringAccess().getIDTerminalRuleCall_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__EString__Alternatives"


    // $ANTLR start "rule__DivergenceType__Alternatives"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:291:1: rule__DivergenceType__Alternatives : ( ( ( 'Choice' ) ) | ( ( 'Parallel' ) ) );
    public final void rule__DivergenceType__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:295:1: ( ( ( 'Choice' ) ) | ( ( 'Parallel' ) ) )
            int alt3=2;
            int LA3_0 = input.LA(1);

            if ( (LA3_0==11) ) {
                alt3=1;
            }
            else if ( (LA3_0==12) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 3, 0, input);

                throw nvae;
            }
            switch (alt3) {
                case 1 :
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:296:1: ( ( 'Choice' ) )
                    {
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:296:1: ( ( 'Choice' ) )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:297:1: ( 'Choice' )
                    {
                     before(grammarAccess.getDivergenceTypeAccess().getChoiceEnumLiteralDeclaration_0()); 
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:298:1: ( 'Choice' )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:298:3: 'Choice'
                    {
                    match(input,11,FollowSets000.FOLLOW_11_in_rule__DivergenceType__Alternatives565); 

                    }

                     after(grammarAccess.getDivergenceTypeAccess().getChoiceEnumLiteralDeclaration_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:303:6: ( ( 'Parallel' ) )
                    {
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:303:6: ( ( 'Parallel' ) )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:304:1: ( 'Parallel' )
                    {
                     before(grammarAccess.getDivergenceTypeAccess().getParallelEnumLiteralDeclaration_1()); 
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:305:1: ( 'Parallel' )
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:305:3: 'Parallel'
                    {
                    match(input,12,FollowSets000.FOLLOW_12_in_rule__DivergenceType__Alternatives586); 

                    }

                     after(grammarAccess.getDivergenceTypeAccess().getParallelEnumLiteralDeclaration_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DivergenceType__Alternatives"


    // $ANTLR start "rule__Scenario__Group__0"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:317:1: rule__Scenario__Group__0 : rule__Scenario__Group__0__Impl rule__Scenario__Group__1 ;
    public final void rule__Scenario__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:321:1: ( rule__Scenario__Group__0__Impl rule__Scenario__Group__1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:322:2: rule__Scenario__Group__0__Impl rule__Scenario__Group__1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Scenario__Group__0__Impl_in_rule__Scenario__Group__0619);
            rule__Scenario__Group__0__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Scenario__Group__1_in_rule__Scenario__Group__0622);
            rule__Scenario__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__Group__0"


    // $ANTLR start "rule__Scenario__Group__0__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:329:1: rule__Scenario__Group__0__Impl : ( 'Scenario' ) ;
    public final void rule__Scenario__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:333:1: ( ( 'Scenario' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:334:1: ( 'Scenario' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:334:1: ( 'Scenario' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:335:1: 'Scenario'
            {
             before(grammarAccess.getScenarioAccess().getScenarioKeyword_0()); 
            match(input,13,FollowSets000.FOLLOW_13_in_rule__Scenario__Group__0__Impl650); 
             after(grammarAccess.getScenarioAccess().getScenarioKeyword_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__Group__0__Impl"


    // $ANTLR start "rule__Scenario__Group__1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:348:1: rule__Scenario__Group__1 : rule__Scenario__Group__1__Impl rule__Scenario__Group__2 ;
    public final void rule__Scenario__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:352:1: ( rule__Scenario__Group__1__Impl rule__Scenario__Group__2 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:353:2: rule__Scenario__Group__1__Impl rule__Scenario__Group__2
            {
            pushFollow(FollowSets000.FOLLOW_rule__Scenario__Group__1__Impl_in_rule__Scenario__Group__1681);
            rule__Scenario__Group__1__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Scenario__Group__2_in_rule__Scenario__Group__1684);
            rule__Scenario__Group__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__Group__1"


    // $ANTLR start "rule__Scenario__Group__1__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:360:1: rule__Scenario__Group__1__Impl : ( ( rule__Scenario__NameAssignment_1 ) ) ;
    public final void rule__Scenario__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:364:1: ( ( ( rule__Scenario__NameAssignment_1 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:365:1: ( ( rule__Scenario__NameAssignment_1 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:365:1: ( ( rule__Scenario__NameAssignment_1 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:366:1: ( rule__Scenario__NameAssignment_1 )
            {
             before(grammarAccess.getScenarioAccess().getNameAssignment_1()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:367:1: ( rule__Scenario__NameAssignment_1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:367:2: rule__Scenario__NameAssignment_1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Scenario__NameAssignment_1_in_rule__Scenario__Group__1__Impl711);
            rule__Scenario__NameAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getScenarioAccess().getNameAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__Group__1__Impl"


    // $ANTLR start "rule__Scenario__Group__2"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:377:1: rule__Scenario__Group__2 : rule__Scenario__Group__2__Impl ;
    public final void rule__Scenario__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:381:1: ( rule__Scenario__Group__2__Impl )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:382:2: rule__Scenario__Group__2__Impl
            {
            pushFollow(FollowSets000.FOLLOW_rule__Scenario__Group__2__Impl_in_rule__Scenario__Group__2741);
            rule__Scenario__Group__2__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__Group__2"


    // $ANTLR start "rule__Scenario__Group__2__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:388:1: rule__Scenario__Group__2__Impl : ( ( rule__Scenario__ScheduleAssignment_2 ) ) ;
    public final void rule__Scenario__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:392:1: ( ( ( rule__Scenario__ScheduleAssignment_2 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:393:1: ( ( rule__Scenario__ScheduleAssignment_2 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:393:1: ( ( rule__Scenario__ScheduleAssignment_2 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:394:1: ( rule__Scenario__ScheduleAssignment_2 )
            {
             before(grammarAccess.getScenarioAccess().getScheduleAssignment_2()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:395:1: ( rule__Scenario__ScheduleAssignment_2 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:395:2: rule__Scenario__ScheduleAssignment_2
            {
            pushFollow(FollowSets000.FOLLOW_rule__Scenario__ScheduleAssignment_2_in_rule__Scenario__Group__2__Impl768);
            rule__Scenario__ScheduleAssignment_2();

            state._fsp--;


            }

             after(grammarAccess.getScenarioAccess().getScheduleAssignment_2()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__Group__2__Impl"


    // $ANTLR start "rule__Schedule__Group__0"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:411:1: rule__Schedule__Group__0 : rule__Schedule__Group__0__Impl rule__Schedule__Group__1 ;
    public final void rule__Schedule__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:415:1: ( rule__Schedule__Group__0__Impl rule__Schedule__Group__1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:416:2: rule__Schedule__Group__0__Impl rule__Schedule__Group__1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__0__Impl_in_rule__Schedule__Group__0804);
            rule__Schedule__Group__0__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__1_in_rule__Schedule__Group__0807);
            rule__Schedule__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__0"


    // $ANTLR start "rule__Schedule__Group__0__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:423:1: rule__Schedule__Group__0__Impl : ( '[' ) ;
    public final void rule__Schedule__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:427:1: ( ( '[' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:428:1: ( '[' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:428:1: ( '[' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:429:1: '['
            {
             before(grammarAccess.getScheduleAccess().getLeftSquareBracketKeyword_0()); 
            match(input,14,FollowSets000.FOLLOW_14_in_rule__Schedule__Group__0__Impl835); 
             after(grammarAccess.getScheduleAccess().getLeftSquareBracketKeyword_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__0__Impl"


    // $ANTLR start "rule__Schedule__Group__1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:442:1: rule__Schedule__Group__1 : rule__Schedule__Group__1__Impl rule__Schedule__Group__2 ;
    public final void rule__Schedule__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:446:1: ( rule__Schedule__Group__1__Impl rule__Schedule__Group__2 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:447:2: rule__Schedule__Group__1__Impl rule__Schedule__Group__2
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__1__Impl_in_rule__Schedule__Group__1866);
            rule__Schedule__Group__1__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__2_in_rule__Schedule__Group__1869);
            rule__Schedule__Group__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__1"


    // $ANTLR start "rule__Schedule__Group__1__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:454:1: rule__Schedule__Group__1__Impl : ( '-' ) ;
    public final void rule__Schedule__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:458:1: ( ( '-' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:459:1: ( '-' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:459:1: ( '-' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:460:1: '-'
            {
             before(grammarAccess.getScheduleAccess().getHyphenMinusKeyword_1()); 
            match(input,15,FollowSets000.FOLLOW_15_in_rule__Schedule__Group__1__Impl897); 
             after(grammarAccess.getScheduleAccess().getHyphenMinusKeyword_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__1__Impl"


    // $ANTLR start "rule__Schedule__Group__2"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:473:1: rule__Schedule__Group__2 : rule__Schedule__Group__2__Impl rule__Schedule__Group__3 ;
    public final void rule__Schedule__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:477:1: ( rule__Schedule__Group__2__Impl rule__Schedule__Group__3 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:478:2: rule__Schedule__Group__2__Impl rule__Schedule__Group__3
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__2__Impl_in_rule__Schedule__Group__2928);
            rule__Schedule__Group__2__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__3_in_rule__Schedule__Group__2931);
            rule__Schedule__Group__3();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__2"


    // $ANTLR start "rule__Schedule__Group__2__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:485:1: rule__Schedule__Group__2__Impl : ( ( rule__Schedule__ComponentsAssignment_2 ) ) ;
    public final void rule__Schedule__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:489:1: ( ( ( rule__Schedule__ComponentsAssignment_2 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:490:1: ( ( rule__Schedule__ComponentsAssignment_2 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:490:1: ( ( rule__Schedule__ComponentsAssignment_2 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:491:1: ( rule__Schedule__ComponentsAssignment_2 )
            {
             before(grammarAccess.getScheduleAccess().getComponentsAssignment_2()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:492:1: ( rule__Schedule__ComponentsAssignment_2 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:492:2: rule__Schedule__ComponentsAssignment_2
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__ComponentsAssignment_2_in_rule__Schedule__Group__2__Impl958);
            rule__Schedule__ComponentsAssignment_2();

            state._fsp--;


            }

             after(grammarAccess.getScheduleAccess().getComponentsAssignment_2()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__2__Impl"


    // $ANTLR start "rule__Schedule__Group__3"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:502:1: rule__Schedule__Group__3 : rule__Schedule__Group__3__Impl rule__Schedule__Group__4 ;
    public final void rule__Schedule__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:506:1: ( rule__Schedule__Group__3__Impl rule__Schedule__Group__4 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:507:2: rule__Schedule__Group__3__Impl rule__Schedule__Group__4
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__3__Impl_in_rule__Schedule__Group__3988);
            rule__Schedule__Group__3__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__4_in_rule__Schedule__Group__3991);
            rule__Schedule__Group__4();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__3"


    // $ANTLR start "rule__Schedule__Group__3__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:514:1: rule__Schedule__Group__3__Impl : ( ( rule__Schedule__Group_3__0 )* ) ;
    public final void rule__Schedule__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:518:1: ( ( ( rule__Schedule__Group_3__0 )* ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:519:1: ( ( rule__Schedule__Group_3__0 )* )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:519:1: ( ( rule__Schedule__Group_3__0 )* )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:520:1: ( rule__Schedule__Group_3__0 )*
            {
             before(grammarAccess.getScheduleAccess().getGroup_3()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:521:1: ( rule__Schedule__Group_3__0 )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);

                if ( (LA4_0==15) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:521:2: rule__Schedule__Group_3__0
            	    {
            	    pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group_3__0_in_rule__Schedule__Group__3__Impl1018);
            	    rule__Schedule__Group_3__0();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);

             after(grammarAccess.getScheduleAccess().getGroup_3()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__3__Impl"


    // $ANTLR start "rule__Schedule__Group__4"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:531:1: rule__Schedule__Group__4 : rule__Schedule__Group__4__Impl ;
    public final void rule__Schedule__Group__4() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:535:1: ( rule__Schedule__Group__4__Impl )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:536:2: rule__Schedule__Group__4__Impl
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group__4__Impl_in_rule__Schedule__Group__41049);
            rule__Schedule__Group__4__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__4"


    // $ANTLR start "rule__Schedule__Group__4__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:542:1: rule__Schedule__Group__4__Impl : ( ']' ) ;
    public final void rule__Schedule__Group__4__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:546:1: ( ( ']' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:547:1: ( ']' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:547:1: ( ']' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:548:1: ']'
            {
             before(grammarAccess.getScheduleAccess().getRightSquareBracketKeyword_4()); 
            match(input,16,FollowSets000.FOLLOW_16_in_rule__Schedule__Group__4__Impl1077); 
             after(grammarAccess.getScheduleAccess().getRightSquareBracketKeyword_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group__4__Impl"


    // $ANTLR start "rule__Schedule__Group_3__0"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:571:1: rule__Schedule__Group_3__0 : rule__Schedule__Group_3__0__Impl rule__Schedule__Group_3__1 ;
    public final void rule__Schedule__Group_3__0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:575:1: ( rule__Schedule__Group_3__0__Impl rule__Schedule__Group_3__1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:576:2: rule__Schedule__Group_3__0__Impl rule__Schedule__Group_3__1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group_3__0__Impl_in_rule__Schedule__Group_3__01118);
            rule__Schedule__Group_3__0__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group_3__1_in_rule__Schedule__Group_3__01121);
            rule__Schedule__Group_3__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group_3__0"


    // $ANTLR start "rule__Schedule__Group_3__0__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:583:1: rule__Schedule__Group_3__0__Impl : ( '-' ) ;
    public final void rule__Schedule__Group_3__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:587:1: ( ( '-' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:588:1: ( '-' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:588:1: ( '-' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:589:1: '-'
            {
             before(grammarAccess.getScheduleAccess().getHyphenMinusKeyword_3_0()); 
            match(input,15,FollowSets000.FOLLOW_15_in_rule__Schedule__Group_3__0__Impl1149); 
             after(grammarAccess.getScheduleAccess().getHyphenMinusKeyword_3_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group_3__0__Impl"


    // $ANTLR start "rule__Schedule__Group_3__1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:602:1: rule__Schedule__Group_3__1 : rule__Schedule__Group_3__1__Impl ;
    public final void rule__Schedule__Group_3__1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:606:1: ( rule__Schedule__Group_3__1__Impl )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:607:2: rule__Schedule__Group_3__1__Impl
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__Group_3__1__Impl_in_rule__Schedule__Group_3__11180);
            rule__Schedule__Group_3__1__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group_3__1"


    // $ANTLR start "rule__Schedule__Group_3__1__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:613:1: rule__Schedule__Group_3__1__Impl : ( ( rule__Schedule__ComponentsAssignment_3_1 ) ) ;
    public final void rule__Schedule__Group_3__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:617:1: ( ( ( rule__Schedule__ComponentsAssignment_3_1 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:618:1: ( ( rule__Schedule__ComponentsAssignment_3_1 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:618:1: ( ( rule__Schedule__ComponentsAssignment_3_1 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:619:1: ( rule__Schedule__ComponentsAssignment_3_1 )
            {
             before(grammarAccess.getScheduleAccess().getComponentsAssignment_3_1()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:620:1: ( rule__Schedule__ComponentsAssignment_3_1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:620:2: rule__Schedule__ComponentsAssignment_3_1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Schedule__ComponentsAssignment_3_1_in_rule__Schedule__Group_3__1__Impl1207);
            rule__Schedule__ComponentsAssignment_3_1();

            state._fsp--;


            }

             after(grammarAccess.getScheduleAccess().getComponentsAssignment_3_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__Group_3__1__Impl"


    // $ANTLR start "rule__Activity__Group__0"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:634:1: rule__Activity__Group__0 : rule__Activity__Group__0__Impl rule__Activity__Group__1 ;
    public final void rule__Activity__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:638:1: ( rule__Activity__Group__0__Impl rule__Activity__Group__1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:639:2: rule__Activity__Group__0__Impl rule__Activity__Group__1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__0__Impl_in_rule__Activity__Group__01241);
            rule__Activity__Group__0__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__1_in_rule__Activity__Group__01244);
            rule__Activity__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__0"


    // $ANTLR start "rule__Activity__Group__0__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:646:1: rule__Activity__Group__0__Impl : ( () ) ;
    public final void rule__Activity__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:650:1: ( ( () ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:651:1: ( () )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:651:1: ( () )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:652:1: ()
            {
             before(grammarAccess.getActivityAccess().getActivityAction_0()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:653:1: ()
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:655:1: 
            {
            }

             after(grammarAccess.getActivityAccess().getActivityAction_0()); 

            }


            }

        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__0__Impl"


    // $ANTLR start "rule__Activity__Group__1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:665:1: rule__Activity__Group__1 : rule__Activity__Group__1__Impl rule__Activity__Group__2 ;
    public final void rule__Activity__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:669:1: ( rule__Activity__Group__1__Impl rule__Activity__Group__2 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:670:2: rule__Activity__Group__1__Impl rule__Activity__Group__2
            {
            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__1__Impl_in_rule__Activity__Group__11302);
            rule__Activity__Group__1__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__2_in_rule__Activity__Group__11305);
            rule__Activity__Group__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__1"


    // $ANTLR start "rule__Activity__Group__1__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:677:1: rule__Activity__Group__1__Impl : ( 'Act' ) ;
    public final void rule__Activity__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:681:1: ( ( 'Act' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:682:1: ( 'Act' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:682:1: ( 'Act' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:683:1: 'Act'
            {
             before(grammarAccess.getActivityAccess().getActKeyword_1()); 
            match(input,17,FollowSets000.FOLLOW_17_in_rule__Activity__Group__1__Impl1333); 
             after(grammarAccess.getActivityAccess().getActKeyword_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__1__Impl"


    // $ANTLR start "rule__Activity__Group__2"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:696:1: rule__Activity__Group__2 : rule__Activity__Group__2__Impl rule__Activity__Group__3 ;
    public final void rule__Activity__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:700:1: ( rule__Activity__Group__2__Impl rule__Activity__Group__3 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:701:2: rule__Activity__Group__2__Impl rule__Activity__Group__3
            {
            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__2__Impl_in_rule__Activity__Group__21364);
            rule__Activity__Group__2__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__3_in_rule__Activity__Group__21367);
            rule__Activity__Group__3();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__2"


    // $ANTLR start "rule__Activity__Group__2__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:708:1: rule__Activity__Group__2__Impl : ( ( rule__Activity__NameAssignment_2 ) ) ;
    public final void rule__Activity__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:712:1: ( ( ( rule__Activity__NameAssignment_2 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:713:1: ( ( rule__Activity__NameAssignment_2 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:713:1: ( ( rule__Activity__NameAssignment_2 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:714:1: ( rule__Activity__NameAssignment_2 )
            {
             before(grammarAccess.getActivityAccess().getNameAssignment_2()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:715:1: ( rule__Activity__NameAssignment_2 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:715:2: rule__Activity__NameAssignment_2
            {
            pushFollow(FollowSets000.FOLLOW_rule__Activity__NameAssignment_2_in_rule__Activity__Group__2__Impl1394);
            rule__Activity__NameAssignment_2();

            state._fsp--;


            }

             after(grammarAccess.getActivityAccess().getNameAssignment_2()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__2__Impl"


    // $ANTLR start "rule__Activity__Group__3"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:725:1: rule__Activity__Group__3 : rule__Activity__Group__3__Impl ;
    public final void rule__Activity__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:729:1: ( rule__Activity__Group__3__Impl )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:730:2: rule__Activity__Group__3__Impl
            {
            pushFollow(FollowSets000.FOLLOW_rule__Activity__Group__3__Impl_in_rule__Activity__Group__31424);
            rule__Activity__Group__3__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__3"


    // $ANTLR start "rule__Activity__Group__3__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:736:1: rule__Activity__Group__3__Impl : ( ( rule__Activity__ScheduleAssignment_3 )? ) ;
    public final void rule__Activity__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:740:1: ( ( ( rule__Activity__ScheduleAssignment_3 )? ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:741:1: ( ( rule__Activity__ScheduleAssignment_3 )? )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:741:1: ( ( rule__Activity__ScheduleAssignment_3 )? )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:742:1: ( rule__Activity__ScheduleAssignment_3 )?
            {
             before(grammarAccess.getActivityAccess().getScheduleAssignment_3()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:743:1: ( rule__Activity__ScheduleAssignment_3 )?
            int alt5=2;
            int LA5_0 = input.LA(1);

            if ( (LA5_0==14) ) {
                alt5=1;
            }
            switch (alt5) {
                case 1 :
                    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:743:2: rule__Activity__ScheduleAssignment_3
                    {
                    pushFollow(FollowSets000.FOLLOW_rule__Activity__ScheduleAssignment_3_in_rule__Activity__Group__3__Impl1451);
                    rule__Activity__ScheduleAssignment_3();

                    state._fsp--;


                    }
                    break;

            }

             after(grammarAccess.getActivityAccess().getScheduleAssignment_3()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__Group__3__Impl"


    // $ANTLR start "rule__Divergence__Group__0"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:761:1: rule__Divergence__Group__0 : rule__Divergence__Group__0__Impl rule__Divergence__Group__1 ;
    public final void rule__Divergence__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:765:1: ( rule__Divergence__Group__0__Impl rule__Divergence__Group__1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:766:2: rule__Divergence__Group__0__Impl rule__Divergence__Group__1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__0__Impl_in_rule__Divergence__Group__01490);
            rule__Divergence__Group__0__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__1_in_rule__Divergence__Group__01493);
            rule__Divergence__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__0"


    // $ANTLR start "rule__Divergence__Group__0__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:773:1: rule__Divergence__Group__0__Impl : ( 'Div' ) ;
    public final void rule__Divergence__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:777:1: ( ( 'Div' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:778:1: ( 'Div' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:778:1: ( 'Div' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:779:1: 'Div'
            {
             before(grammarAccess.getDivergenceAccess().getDivKeyword_0()); 
            match(input,18,FollowSets000.FOLLOW_18_in_rule__Divergence__Group__0__Impl1521); 
             after(grammarAccess.getDivergenceAccess().getDivKeyword_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__0__Impl"


    // $ANTLR start "rule__Divergence__Group__1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:792:1: rule__Divergence__Group__1 : rule__Divergence__Group__1__Impl rule__Divergence__Group__2 ;
    public final void rule__Divergence__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:796:1: ( rule__Divergence__Group__1__Impl rule__Divergence__Group__2 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:797:2: rule__Divergence__Group__1__Impl rule__Divergence__Group__2
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__1__Impl_in_rule__Divergence__Group__11552);
            rule__Divergence__Group__1__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__2_in_rule__Divergence__Group__11555);
            rule__Divergence__Group__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__1"


    // $ANTLR start "rule__Divergence__Group__1__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:804:1: rule__Divergence__Group__1__Impl : ( ( rule__Divergence__TypeAssignment_1 ) ) ;
    public final void rule__Divergence__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:808:1: ( ( ( rule__Divergence__TypeAssignment_1 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:809:1: ( ( rule__Divergence__TypeAssignment_1 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:809:1: ( ( rule__Divergence__TypeAssignment_1 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:810:1: ( rule__Divergence__TypeAssignment_1 )
            {
             before(grammarAccess.getDivergenceAccess().getTypeAssignment_1()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:811:1: ( rule__Divergence__TypeAssignment_1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:811:2: rule__Divergence__TypeAssignment_1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__TypeAssignment_1_in_rule__Divergence__Group__1__Impl1582);
            rule__Divergence__TypeAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getDivergenceAccess().getTypeAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__1__Impl"


    // $ANTLR start "rule__Divergence__Group__2"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:821:1: rule__Divergence__Group__2 : rule__Divergence__Group__2__Impl rule__Divergence__Group__3 ;
    public final void rule__Divergence__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:825:1: ( rule__Divergence__Group__2__Impl rule__Divergence__Group__3 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:826:2: rule__Divergence__Group__2__Impl rule__Divergence__Group__3
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__2__Impl_in_rule__Divergence__Group__21612);
            rule__Divergence__Group__2__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__3_in_rule__Divergence__Group__21615);
            rule__Divergence__Group__3();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__2"


    // $ANTLR start "rule__Divergence__Group__2__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:833:1: rule__Divergence__Group__2__Impl : ( '[' ) ;
    public final void rule__Divergence__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:837:1: ( ( '[' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:838:1: ( '[' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:838:1: ( '[' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:839:1: '['
            {
             before(grammarAccess.getDivergenceAccess().getLeftSquareBracketKeyword_2()); 
            match(input,14,FollowSets000.FOLLOW_14_in_rule__Divergence__Group__2__Impl1643); 
             after(grammarAccess.getDivergenceAccess().getLeftSquareBracketKeyword_2()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__2__Impl"


    // $ANTLR start "rule__Divergence__Group__3"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:852:1: rule__Divergence__Group__3 : rule__Divergence__Group__3__Impl rule__Divergence__Group__4 ;
    public final void rule__Divergence__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:856:1: ( rule__Divergence__Group__3__Impl rule__Divergence__Group__4 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:857:2: rule__Divergence__Group__3__Impl rule__Divergence__Group__4
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__3__Impl_in_rule__Divergence__Group__31674);
            rule__Divergence__Group__3__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__4_in_rule__Divergence__Group__31677);
            rule__Divergence__Group__4();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__3"


    // $ANTLR start "rule__Divergence__Group__3__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:864:1: rule__Divergence__Group__3__Impl : ( ( rule__Divergence__SchedulesAssignment_3 ) ) ;
    public final void rule__Divergence__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:868:1: ( ( ( rule__Divergence__SchedulesAssignment_3 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:869:1: ( ( rule__Divergence__SchedulesAssignment_3 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:869:1: ( ( rule__Divergence__SchedulesAssignment_3 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:870:1: ( rule__Divergence__SchedulesAssignment_3 )
            {
             before(grammarAccess.getDivergenceAccess().getSchedulesAssignment_3()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:871:1: ( rule__Divergence__SchedulesAssignment_3 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:871:2: rule__Divergence__SchedulesAssignment_3
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__SchedulesAssignment_3_in_rule__Divergence__Group__3__Impl1704);
            rule__Divergence__SchedulesAssignment_3();

            state._fsp--;


            }

             after(grammarAccess.getDivergenceAccess().getSchedulesAssignment_3()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__3__Impl"


    // $ANTLR start "rule__Divergence__Group__4"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:881:1: rule__Divergence__Group__4 : rule__Divergence__Group__4__Impl rule__Divergence__Group__5 ;
    public final void rule__Divergence__Group__4() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:885:1: ( rule__Divergence__Group__4__Impl rule__Divergence__Group__5 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:886:2: rule__Divergence__Group__4__Impl rule__Divergence__Group__5
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__4__Impl_in_rule__Divergence__Group__41734);
            rule__Divergence__Group__4__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__5_in_rule__Divergence__Group__41737);
            rule__Divergence__Group__5();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__4"


    // $ANTLR start "rule__Divergence__Group__4__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:893:1: rule__Divergence__Group__4__Impl : ( ( rule__Divergence__Group_4__0 )* ) ;
    public final void rule__Divergence__Group__4__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:897:1: ( ( ( rule__Divergence__Group_4__0 )* ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:898:1: ( ( rule__Divergence__Group_4__0 )* )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:898:1: ( ( rule__Divergence__Group_4__0 )* )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:899:1: ( rule__Divergence__Group_4__0 )*
            {
             before(grammarAccess.getDivergenceAccess().getGroup_4()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:900:1: ( rule__Divergence__Group_4__0 )*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);

                if ( (LA6_0==19) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:900:2: rule__Divergence__Group_4__0
            	    {
            	    pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group_4__0_in_rule__Divergence__Group__4__Impl1764);
            	    rule__Divergence__Group_4__0();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop6;
                }
            } while (true);

             after(grammarAccess.getDivergenceAccess().getGroup_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__4__Impl"


    // $ANTLR start "rule__Divergence__Group__5"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:910:1: rule__Divergence__Group__5 : rule__Divergence__Group__5__Impl ;
    public final void rule__Divergence__Group__5() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:914:1: ( rule__Divergence__Group__5__Impl )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:915:2: rule__Divergence__Group__5__Impl
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group__5__Impl_in_rule__Divergence__Group__51795);
            rule__Divergence__Group__5__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__5"


    // $ANTLR start "rule__Divergence__Group__5__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:921:1: rule__Divergence__Group__5__Impl : ( ']' ) ;
    public final void rule__Divergence__Group__5__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:925:1: ( ( ']' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:926:1: ( ']' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:926:1: ( ']' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:927:1: ']'
            {
             before(grammarAccess.getDivergenceAccess().getRightSquareBracketKeyword_5()); 
            match(input,16,FollowSets000.FOLLOW_16_in_rule__Divergence__Group__5__Impl1823); 
             after(grammarAccess.getDivergenceAccess().getRightSquareBracketKeyword_5()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group__5__Impl"


    // $ANTLR start "rule__Divergence__Group_4__0"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:952:1: rule__Divergence__Group_4__0 : rule__Divergence__Group_4__0__Impl rule__Divergence__Group_4__1 ;
    public final void rule__Divergence__Group_4__0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:956:1: ( rule__Divergence__Group_4__0__Impl rule__Divergence__Group_4__1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:957:2: rule__Divergence__Group_4__0__Impl rule__Divergence__Group_4__1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group_4__0__Impl_in_rule__Divergence__Group_4__01866);
            rule__Divergence__Group_4__0__Impl();

            state._fsp--;

            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group_4__1_in_rule__Divergence__Group_4__01869);
            rule__Divergence__Group_4__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group_4__0"


    // $ANTLR start "rule__Divergence__Group_4__0__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:964:1: rule__Divergence__Group_4__0__Impl : ( ',' ) ;
    public final void rule__Divergence__Group_4__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:968:1: ( ( ',' ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:969:1: ( ',' )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:969:1: ( ',' )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:970:1: ','
            {
             before(grammarAccess.getDivergenceAccess().getCommaKeyword_4_0()); 
            match(input,19,FollowSets000.FOLLOW_19_in_rule__Divergence__Group_4__0__Impl1897); 
             after(grammarAccess.getDivergenceAccess().getCommaKeyword_4_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group_4__0__Impl"


    // $ANTLR start "rule__Divergence__Group_4__1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:983:1: rule__Divergence__Group_4__1 : rule__Divergence__Group_4__1__Impl ;
    public final void rule__Divergence__Group_4__1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:987:1: ( rule__Divergence__Group_4__1__Impl )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:988:2: rule__Divergence__Group_4__1__Impl
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__Group_4__1__Impl_in_rule__Divergence__Group_4__11928);
            rule__Divergence__Group_4__1__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group_4__1"


    // $ANTLR start "rule__Divergence__Group_4__1__Impl"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:994:1: rule__Divergence__Group_4__1__Impl : ( ( rule__Divergence__SchedulesAssignment_4_1 ) ) ;
    public final void rule__Divergence__Group_4__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:998:1: ( ( ( rule__Divergence__SchedulesAssignment_4_1 ) ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:999:1: ( ( rule__Divergence__SchedulesAssignment_4_1 ) )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:999:1: ( ( rule__Divergence__SchedulesAssignment_4_1 ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1000:1: ( rule__Divergence__SchedulesAssignment_4_1 )
            {
             before(grammarAccess.getDivergenceAccess().getSchedulesAssignment_4_1()); 
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1001:1: ( rule__Divergence__SchedulesAssignment_4_1 )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1001:2: rule__Divergence__SchedulesAssignment_4_1
            {
            pushFollow(FollowSets000.FOLLOW_rule__Divergence__SchedulesAssignment_4_1_in_rule__Divergence__Group_4__1__Impl1955);
            rule__Divergence__SchedulesAssignment_4_1();

            state._fsp--;


            }

             after(grammarAccess.getDivergenceAccess().getSchedulesAssignment_4_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__Group_4__1__Impl"


    // $ANTLR start "rule__Scenario__NameAssignment_1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1016:1: rule__Scenario__NameAssignment_1 : ( ruleEString ) ;
    public final void rule__Scenario__NameAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1020:1: ( ( ruleEString ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1021:1: ( ruleEString )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1021:1: ( ruleEString )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1022:1: ruleEString
            {
             before(grammarAccess.getScenarioAccess().getNameEStringParserRuleCall_1_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleEString_in_rule__Scenario__NameAssignment_11994);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getScenarioAccess().getNameEStringParserRuleCall_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__NameAssignment_1"


    // $ANTLR start "rule__Scenario__ScheduleAssignment_2"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1031:1: rule__Scenario__ScheduleAssignment_2 : ( ruleSchedule ) ;
    public final void rule__Scenario__ScheduleAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1035:1: ( ( ruleSchedule ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1036:1: ( ruleSchedule )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1036:1: ( ruleSchedule )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1037:1: ruleSchedule
            {
             before(grammarAccess.getScenarioAccess().getScheduleScheduleParserRuleCall_2_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_rule__Scenario__ScheduleAssignment_22025);
            ruleSchedule();

            state._fsp--;

             after(grammarAccess.getScenarioAccess().getScheduleScheduleParserRuleCall_2_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Scenario__ScheduleAssignment_2"


    // $ANTLR start "rule__Schedule__ComponentsAssignment_2"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1046:1: rule__Schedule__ComponentsAssignment_2 : ( ruleComponent ) ;
    public final void rule__Schedule__ComponentsAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1050:1: ( ( ruleComponent ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1051:1: ( ruleComponent )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1051:1: ( ruleComponent )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1052:1: ruleComponent
            {
             before(grammarAccess.getScheduleAccess().getComponentsComponentParserRuleCall_2_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleComponent_in_rule__Schedule__ComponentsAssignment_22056);
            ruleComponent();

            state._fsp--;

             after(grammarAccess.getScheduleAccess().getComponentsComponentParserRuleCall_2_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__ComponentsAssignment_2"


    // $ANTLR start "rule__Schedule__ComponentsAssignment_3_1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1061:1: rule__Schedule__ComponentsAssignment_3_1 : ( ruleComponent ) ;
    public final void rule__Schedule__ComponentsAssignment_3_1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1065:1: ( ( ruleComponent ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1066:1: ( ruleComponent )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1066:1: ( ruleComponent )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1067:1: ruleComponent
            {
             before(grammarAccess.getScheduleAccess().getComponentsComponentParserRuleCall_3_1_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleComponent_in_rule__Schedule__ComponentsAssignment_3_12087);
            ruleComponent();

            state._fsp--;

             after(grammarAccess.getScheduleAccess().getComponentsComponentParserRuleCall_3_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Schedule__ComponentsAssignment_3_1"


    // $ANTLR start "rule__Activity__NameAssignment_2"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1076:1: rule__Activity__NameAssignment_2 : ( ruleEString ) ;
    public final void rule__Activity__NameAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1080:1: ( ( ruleEString ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1081:1: ( ruleEString )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1081:1: ( ruleEString )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1082:1: ruleEString
            {
             before(grammarAccess.getActivityAccess().getNameEStringParserRuleCall_2_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleEString_in_rule__Activity__NameAssignment_22118);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getActivityAccess().getNameEStringParserRuleCall_2_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__NameAssignment_2"


    // $ANTLR start "rule__Activity__ScheduleAssignment_3"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1091:1: rule__Activity__ScheduleAssignment_3 : ( ruleSchedule ) ;
    public final void rule__Activity__ScheduleAssignment_3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1095:1: ( ( ruleSchedule ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1096:1: ( ruleSchedule )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1096:1: ( ruleSchedule )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1097:1: ruleSchedule
            {
             before(grammarAccess.getActivityAccess().getScheduleScheduleParserRuleCall_3_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_rule__Activity__ScheduleAssignment_32149);
            ruleSchedule();

            state._fsp--;

             after(grammarAccess.getActivityAccess().getScheduleScheduleParserRuleCall_3_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Activity__ScheduleAssignment_3"


    // $ANTLR start "rule__Divergence__TypeAssignment_1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1106:1: rule__Divergence__TypeAssignment_1 : ( ruleDivergenceType ) ;
    public final void rule__Divergence__TypeAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1110:1: ( ( ruleDivergenceType ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1111:1: ( ruleDivergenceType )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1111:1: ( ruleDivergenceType )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1112:1: ruleDivergenceType
            {
             before(grammarAccess.getDivergenceAccess().getTypeDivergenceTypeEnumRuleCall_1_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleDivergenceType_in_rule__Divergence__TypeAssignment_12180);
            ruleDivergenceType();

            state._fsp--;

             after(grammarAccess.getDivergenceAccess().getTypeDivergenceTypeEnumRuleCall_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__TypeAssignment_1"


    // $ANTLR start "rule__Divergence__SchedulesAssignment_3"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1121:1: rule__Divergence__SchedulesAssignment_3 : ( ruleSchedule ) ;
    public final void rule__Divergence__SchedulesAssignment_3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1125:1: ( ( ruleSchedule ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1126:1: ( ruleSchedule )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1126:1: ( ruleSchedule )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1127:1: ruleSchedule
            {
             before(grammarAccess.getDivergenceAccess().getSchedulesScheduleParserRuleCall_3_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_rule__Divergence__SchedulesAssignment_32211);
            ruleSchedule();

            state._fsp--;

             after(grammarAccess.getDivergenceAccess().getSchedulesScheduleParserRuleCall_3_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__SchedulesAssignment_3"


    // $ANTLR start "rule__Divergence__SchedulesAssignment_4_1"
    // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1136:1: rule__Divergence__SchedulesAssignment_4_1 : ( ruleSchedule ) ;
    public final void rule__Divergence__SchedulesAssignment_4_1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1140:1: ( ( ruleSchedule ) )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1141:1: ( ruleSchedule )
            {
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1141:1: ( ruleSchedule )
            // ../scenario.xtext2.ui/src-gen/scenario/ui/contentassist/antlr/internal/InternalScenario.g:1142:1: ruleSchedule
            {
             before(grammarAccess.getDivergenceAccess().getSchedulesScheduleParserRuleCall_4_1_0()); 
            pushFollow(FollowSets000.FOLLOW_ruleSchedule_in_rule__Divergence__SchedulesAssignment_4_12242);
            ruleSchedule();

            state._fsp--;

             after(grammarAccess.getDivergenceAccess().getSchedulesScheduleParserRuleCall_4_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Divergence__SchedulesAssignment_4_1"

    // Delegated rules


 

    
    private static class FollowSets000 {
        public static final BitSet FOLLOW_ruleScenario_in_entryRuleScenario61 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleScenario68 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Scenario__Group__0_in_ruleScenario94 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleComponent_in_entryRuleComponent121 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleComponent128 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Component__Alternatives_in_ruleComponent154 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleEString_in_entryRuleEString181 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleEString188 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__EString__Alternatives_in_ruleEString214 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleSchedule_in_entryRuleSchedule241 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleSchedule248 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group__0_in_ruleSchedule274 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleActivity_in_entryRuleActivity301 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleActivity308 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Activity__Group__0_in_ruleActivity334 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleDivergence_in_entryRuleDivergence361 = new BitSet(new long[]{0x0000000000000000L});
        public static final BitSet FOLLOW_EOF_in_entryRuleDivergence368 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group__0_in_ruleDivergence394 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__DivergenceType__Alternatives_in_ruleDivergenceType431 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleActivity_in_rule__Component__Alternatives466 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleDivergence_in_rule__Component__Alternatives483 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_RULE_STRING_in_rule__EString__Alternatives515 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_RULE_ID_in_rule__EString__Alternatives532 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_11_in_rule__DivergenceType__Alternatives565 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_12_in_rule__DivergenceType__Alternatives586 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Scenario__Group__0__Impl_in_rule__Scenario__Group__0619 = new BitSet(new long[]{0x0000000000000030L});
        public static final BitSet FOLLOW_rule__Scenario__Group__1_in_rule__Scenario__Group__0622 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_13_in_rule__Scenario__Group__0__Impl650 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Scenario__Group__1__Impl_in_rule__Scenario__Group__1681 = new BitSet(new long[]{0x0000000000004000L});
        public static final BitSet FOLLOW_rule__Scenario__Group__2_in_rule__Scenario__Group__1684 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Scenario__NameAssignment_1_in_rule__Scenario__Group__1__Impl711 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Scenario__Group__2__Impl_in_rule__Scenario__Group__2741 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Scenario__ScheduleAssignment_2_in_rule__Scenario__Group__2__Impl768 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group__0__Impl_in_rule__Schedule__Group__0804 = new BitSet(new long[]{0x0000000000008000L});
        public static final BitSet FOLLOW_rule__Schedule__Group__1_in_rule__Schedule__Group__0807 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_14_in_rule__Schedule__Group__0__Impl835 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group__1__Impl_in_rule__Schedule__Group__1866 = new BitSet(new long[]{0x0000000000060000L});
        public static final BitSet FOLLOW_rule__Schedule__Group__2_in_rule__Schedule__Group__1869 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_15_in_rule__Schedule__Group__1__Impl897 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group__2__Impl_in_rule__Schedule__Group__2928 = new BitSet(new long[]{0x0000000000018000L});
        public static final BitSet FOLLOW_rule__Schedule__Group__3_in_rule__Schedule__Group__2931 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__ComponentsAssignment_2_in_rule__Schedule__Group__2__Impl958 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group__3__Impl_in_rule__Schedule__Group__3988 = new BitSet(new long[]{0x0000000000018000L});
        public static final BitSet FOLLOW_rule__Schedule__Group__4_in_rule__Schedule__Group__3991 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group_3__0_in_rule__Schedule__Group__3__Impl1018 = new BitSet(new long[]{0x0000000000008002L});
        public static final BitSet FOLLOW_rule__Schedule__Group__4__Impl_in_rule__Schedule__Group__41049 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_16_in_rule__Schedule__Group__4__Impl1077 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group_3__0__Impl_in_rule__Schedule__Group_3__01118 = new BitSet(new long[]{0x0000000000060000L});
        public static final BitSet FOLLOW_rule__Schedule__Group_3__1_in_rule__Schedule__Group_3__01121 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_15_in_rule__Schedule__Group_3__0__Impl1149 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__Group_3__1__Impl_in_rule__Schedule__Group_3__11180 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Schedule__ComponentsAssignment_3_1_in_rule__Schedule__Group_3__1__Impl1207 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Activity__Group__0__Impl_in_rule__Activity__Group__01241 = new BitSet(new long[]{0x0000000000020000L});
        public static final BitSet FOLLOW_rule__Activity__Group__1_in_rule__Activity__Group__01244 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Activity__Group__1__Impl_in_rule__Activity__Group__11302 = new BitSet(new long[]{0x0000000000000030L});
        public static final BitSet FOLLOW_rule__Activity__Group__2_in_rule__Activity__Group__11305 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_17_in_rule__Activity__Group__1__Impl1333 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Activity__Group__2__Impl_in_rule__Activity__Group__21364 = new BitSet(new long[]{0x0000000000004000L});
        public static final BitSet FOLLOW_rule__Activity__Group__3_in_rule__Activity__Group__21367 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Activity__NameAssignment_2_in_rule__Activity__Group__2__Impl1394 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Activity__Group__3__Impl_in_rule__Activity__Group__31424 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Activity__ScheduleAssignment_3_in_rule__Activity__Group__3__Impl1451 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group__0__Impl_in_rule__Divergence__Group__01490 = new BitSet(new long[]{0x0000000000001800L});
        public static final BitSet FOLLOW_rule__Divergence__Group__1_in_rule__Divergence__Group__01493 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_18_in_rule__Divergence__Group__0__Impl1521 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group__1__Impl_in_rule__Divergence__Group__11552 = new BitSet(new long[]{0x0000000000004000L});
        public static final BitSet FOLLOW_rule__Divergence__Group__2_in_rule__Divergence__Group__11555 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__TypeAssignment_1_in_rule__Divergence__Group__1__Impl1582 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group__2__Impl_in_rule__Divergence__Group__21612 = new BitSet(new long[]{0x0000000000004000L});
        public static final BitSet FOLLOW_rule__Divergence__Group__3_in_rule__Divergence__Group__21615 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_14_in_rule__Divergence__Group__2__Impl1643 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group__3__Impl_in_rule__Divergence__Group__31674 = new BitSet(new long[]{0x0000000000090000L});
        public static final BitSet FOLLOW_rule__Divergence__Group__4_in_rule__Divergence__Group__31677 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__SchedulesAssignment_3_in_rule__Divergence__Group__3__Impl1704 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group__4__Impl_in_rule__Divergence__Group__41734 = new BitSet(new long[]{0x0000000000090000L});
        public static final BitSet FOLLOW_rule__Divergence__Group__5_in_rule__Divergence__Group__41737 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group_4__0_in_rule__Divergence__Group__4__Impl1764 = new BitSet(new long[]{0x0000000000080002L});
        public static final BitSet FOLLOW_rule__Divergence__Group__5__Impl_in_rule__Divergence__Group__51795 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_16_in_rule__Divergence__Group__5__Impl1823 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group_4__0__Impl_in_rule__Divergence__Group_4__01866 = new BitSet(new long[]{0x0000000000004000L});
        public static final BitSet FOLLOW_rule__Divergence__Group_4__1_in_rule__Divergence__Group_4__01869 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_19_in_rule__Divergence__Group_4__0__Impl1897 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__Group_4__1__Impl_in_rule__Divergence__Group_4__11928 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_rule__Divergence__SchedulesAssignment_4_1_in_rule__Divergence__Group_4__1__Impl1955 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleEString_in_rule__Scenario__NameAssignment_11994 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleSchedule_in_rule__Scenario__ScheduleAssignment_22025 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleComponent_in_rule__Schedule__ComponentsAssignment_22056 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleComponent_in_rule__Schedule__ComponentsAssignment_3_12087 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleEString_in_rule__Activity__NameAssignment_22118 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleSchedule_in_rule__Activity__ScheduleAssignment_32149 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleDivergenceType_in_rule__Divergence__TypeAssignment_12180 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleSchedule_in_rule__Divergence__SchedulesAssignment_32211 = new BitSet(new long[]{0x0000000000000002L});
        public static final BitSet FOLLOW_ruleSchedule_in_rule__Divergence__SchedulesAssignment_4_12242 = new BitSet(new long[]{0x0000000000000002L});
    }


}