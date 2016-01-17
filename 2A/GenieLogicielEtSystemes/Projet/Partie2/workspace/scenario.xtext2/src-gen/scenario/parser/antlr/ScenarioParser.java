/*
 * generated by Xtext
 */
package scenario.parser.antlr;

import com.google.inject.Inject;

import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import scenario.services.ScenarioGrammarAccess;

public class ScenarioParser extends org.eclipse.xtext.parser.antlr.AbstractAntlrParser {
	
	@Inject
	private ScenarioGrammarAccess grammarAccess;
	
	@Override
	protected void setInitialHiddenTokens(XtextTokenStream tokenStream) {
		tokenStream.setInitialHiddenTokens("RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT");
	}
	
	@Override
	protected scenario.parser.antlr.internal.InternalScenarioParser createParser(XtextTokenStream stream) {
		return new scenario.parser.antlr.internal.InternalScenarioParser(stream, getGrammarAccess());
	}
	
	@Override 
	protected String getDefaultRuleName() {
		return "Scenario";
	}
	
	public ScenarioGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}
	
	public void setGrammarAccess(ScenarioGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
	
}
