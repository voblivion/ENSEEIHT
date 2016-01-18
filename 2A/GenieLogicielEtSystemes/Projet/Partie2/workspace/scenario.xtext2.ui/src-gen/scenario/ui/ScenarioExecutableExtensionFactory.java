/*
 * generated by Xtext
 */
package scenario.ui;

import org.eclipse.xtext.ui.guice.AbstractGuiceAwareExecutableExtensionFactory;
import org.osgi.framework.Bundle;

import com.google.inject.Injector;

import scenario.ui.internal.ScenarioActivator;

/**
 * This class was generated. Customizations should only happen in a newly
 * introduced subclass. 
 */
public class ScenarioExecutableExtensionFactory extends AbstractGuiceAwareExecutableExtensionFactory {

	@Override
	protected Bundle getBundle() {
		return ScenarioActivator.getInstance().getBundle();
	}
	
	@Override
	protected Injector getInjector() {
		return ScenarioActivator.getInstance().getInjector(ScenarioActivator.SCENARIO_SCENARIO);
	}
	
}