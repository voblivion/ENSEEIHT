/**
 */
package scenario.util;

import java.util.Map;

import org.eclipse.emf.common.util.Diagnostic;
import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.ResourceLocator;

import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.EObjectValidator;

import scenario.*;

/**
 * <!-- begin-user-doc -->
 * The <b>Validator</b> for the model.
 * <!-- end-user-doc -->
 * @see scenario.ScenarioPackage
 * @generated
 */
public class ScenarioValidator extends EObjectValidator {
	/**
	 * The cached model package
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final ScenarioValidator INSTANCE = new ScenarioValidator();

	/**
	 * A constant for the {@link org.eclipse.emf.common.util.Diagnostic#getSource() source} of diagnostic {@link org.eclipse.emf.common.util.Diagnostic#getCode() codes} from this package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.eclipse.emf.common.util.Diagnostic#getSource()
	 * @see org.eclipse.emf.common.util.Diagnostic#getCode()
	 * @generated
	 */
	public static final String DIAGNOSTIC_SOURCE = "scenario";

	/**
	 * A constant with a fixed name that can be used as the base value for additional hand written constants.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static final int GENERATED_DIAGNOSTIC_CODE_COUNT = 0;

	/**
	 * A constant with a fixed name that can be used as the base value for additional hand written constants in a derived class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static final int DIAGNOSTIC_CODE_COUNT = GENERATED_DIAGNOSTIC_CODE_COUNT;

	/**
	 * Creates an instance of the switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ScenarioValidator() {
		super();
	}

	/**
	 * Returns the package of this validator switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EPackage getEPackage() {
	  return ScenarioPackage.eINSTANCE;
	}

	/**
	 * Calls <code>validateXXX</code> for the corresponding classifier of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected boolean validate(int classifierID, Object value, DiagnosticChain diagnostics, Map<Object, Object> context) {
		switch (classifierID) {
			case ScenarioPackage.SCENARIO:
				return validateScenario((Scenario)value, diagnostics, context);
			case ScenarioPackage.SCHEDULE:
				return validateSchedule((Schedule)value, diagnostics, context);
			case ScenarioPackage.COMPONENT:
				return validateComponent((Component)value, diagnostics, context);
			case ScenarioPackage.ACTIVITY:
				return validateActivity((Activity)value, diagnostics, context);
			case ScenarioPackage.DIVERGENCE:
				return validateDivergence((Divergence)value, diagnostics, context);
			case ScenarioPackage.DIVERGENCE_TYPE:
				return validateDivergenceType((DivergenceType)value, diagnostics, context);
			default:
				return true;
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateScenario(Scenario scenario, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(scenario, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(scenario, diagnostics, context);
		if (result || diagnostics != null) result &= validateScenario_namesForbidden(scenario, diagnostics, context);
		return result;
	}

	/**
	 * The cached validation expression for the namesForbidden constraint of '<em>Scenario</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static final String SCENARIO__NAMES_FORBIDDEN__EEXPRESSION = "\n" +
		"\t\t\tSequence{'', 'Scénario'}\n" +
		"\t\t\t->forAll(n | self.name <> n)";

	/**
	 * Validates the namesForbidden constraint of '<em>Scenario</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateScenario_namesForbidden(Scenario scenario, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return
			validate
				(ScenarioPackage.Literals.SCENARIO,
				 scenario,
				 diagnostics,
				 context,
				 "http://www.eclipse.org/emf/2002/Ecore/OCL/Pivot",
				 "namesForbidden",
				 SCENARIO__NAMES_FORBIDDEN__EEXPRESSION,
				 Diagnostic.ERROR,
				 DIAGNOSTIC_SOURCE,
				 0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateSchedule(Schedule schedule, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(schedule, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(schedule, diagnostics, context);
		if (result || diagnostics != null) result &= validateSchedule_uniqueNameForActivities(schedule, diagnostics, context);
		return result;
	}

	/**
	 * The cached validation expression for the uniqueNameForActivities constraint of '<em>Schedule</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static final String SCHEDULE__UNIQUE_NAME_FOR_ACTIVITIES__EEXPRESSION = "\n" +
		"\t\t\tself.components\n" +
		"\t\t\t->select(c | c.oclIsKindOf(Activity))\n" +
		"\t\t\t->collect(c | c.oclAsType(Activity))\n" +
		"\t\t\t->forAll(c1, c2 | c1 <> c2 implies c1.name <> c2.name)";

	/**
	 * Validates the uniqueNameForActivities constraint of '<em>Schedule</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateSchedule_uniqueNameForActivities(Schedule schedule, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return
			validate
				(ScenarioPackage.Literals.SCHEDULE,
				 schedule,
				 diagnostics,
				 context,
				 "http://www.eclipse.org/emf/2002/Ecore/OCL/Pivot",
				 "uniqueNameForActivities",
				 SCHEDULE__UNIQUE_NAME_FOR_ACTIVITIES__EEXPRESSION,
				 Diagnostic.ERROR,
				 DIAGNOSTIC_SOURCE,
				 0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateComponent(Component component, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return validate_EveryDefaultConstraint(component, diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateActivity(Activity activity, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(activity, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(activity, diagnostics, context);
		if (result || diagnostics != null) result &= validateActivity_namesForbidden(activity, diagnostics, context);
		return result;
	}

	/**
	 * The cached validation expression for the namesForbidden constraint of '<em>Activity</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static final String ACTIVITY__NAMES_FORBIDDEN__EEXPRESSION = "\n" +
		"\t\t\tSequence{'', 'Activité', 'Choix', 'Parallèle', 'Alternative'}\n" +
		"\t\t\t->forAll(n | self.name <> n)";

	/**
	 * Validates the namesForbidden constraint of '<em>Activity</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateActivity_namesForbidden(Activity activity, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return
			validate
				(ScenarioPackage.Literals.ACTIVITY,
				 activity,
				 diagnostics,
				 context,
				 "http://www.eclipse.org/emf/2002/Ecore/OCL/Pivot",
				 "namesForbidden",
				 ACTIVITY__NAMES_FORBIDDEN__EEXPRESSION,
				 Diagnostic.ERROR,
				 DIAGNOSTIC_SOURCE,
				 0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateDivergence(Divergence divergence, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return validate_EveryDefaultConstraint(divergence, diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateDivergenceType(DivergenceType divergenceType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return true;
	}

	/**
	 * Returns the resource locator that will be used to fetch messages for this validator's diagnostics.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public ResourceLocator getResourceLocator() {
		// TODO
		// Specialize this to return a resource locator for messages specific to this validator.
		// Ensure that you remove @generated or mark it @generated NOT
		return super.getResourceLocator();
	}

} //ScenarioValidator
