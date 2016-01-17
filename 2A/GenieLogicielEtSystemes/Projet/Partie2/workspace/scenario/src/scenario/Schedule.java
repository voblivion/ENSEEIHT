/**
 */
package scenario;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Schedule</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link scenario.Schedule#getComponents <em>Components</em>}</li>
 *   <li>{@link scenario.Schedule#getParent <em>Parent</em>}</li>
 * </ul>
 *
 * @see scenario.ScenarioPackage#getSchedule()
 * @model annotation="http://www.eclipse.org/emf/2002/Ecore constraints='uniqueNameForActivities'"
 *        annotation="http://www.eclipse.org/emf/2002/Ecore/OCL/Pivot uniqueNameForActivities='\n\t\t\tself.components\n\t\t\t->select(c | c.oclIsKindOf(Activity))\n\t\t\t->collect(c | c.oclAsType(Activity))\n\t\t\t->forAll(c1, c2 | c1 <> c2 implies c1.name <> c2.name)'"
 * @generated
 */
public interface Schedule extends EObject {
	/**
	 * Returns the value of the '<em><b>Components</b></em>' containment reference list.
	 * The list contents are of type {@link scenario.Component}.
	 * It is bidirectional and its opposite is '{@link scenario.Component#getParent <em>Parent</em>}'.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Components</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Components</em>' containment reference list.
	 * @see scenario.ScenarioPackage#getSchedule_Components()
	 * @see scenario.Component#getParent
	 * @model opposite="parent" containment="true" required="true"
	 * @generated
	 */
	EList<Component> getComponents();

	/**
	 * Returns the value of the '<em><b>Parent</b></em>' container reference.
	 * It is bidirectional and its opposite is '{@link scenario.Divergence#getSchedules <em>Schedules</em>}'.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Parent</em>' container reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Parent</em>' container reference.
	 * @see #setParent(Divergence)
	 * @see scenario.ScenarioPackage#getSchedule_Parent()
	 * @see scenario.Divergence#getSchedules
	 * @model opposite="schedules" transient="false"
	 * @generated
	 */
	Divergence getParent();

	/**
	 * Sets the value of the '{@link scenario.Schedule#getParent <em>Parent</em>}' container reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Parent</em>' container reference.
	 * @see #getParent()
	 * @generated
	 */
	void setParent(Divergence value);

} // Schedule
