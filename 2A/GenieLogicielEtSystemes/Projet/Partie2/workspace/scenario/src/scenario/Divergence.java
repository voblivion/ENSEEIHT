/**
 */
package scenario;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Divergence</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link scenario.Divergence#getType <em>Type</em>}</li>
 *   <li>{@link scenario.Divergence#getSchedules <em>Schedules</em>}</li>
 * </ul>
 *
 * @see scenario.ScenarioPackage#getDivergence()
 * @model
 * @generated
 */
public interface Divergence extends Component {
	/**
	 * Returns the value of the '<em><b>Type</b></em>' attribute.
	 * The literals are from the enumeration {@link scenario.DivergenceType}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Type</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Type</em>' attribute.
	 * @see scenario.DivergenceType
	 * @see #setType(DivergenceType)
	 * @see scenario.ScenarioPackage#getDivergence_Type()
	 * @model required="true"
	 * @generated
	 */
	DivergenceType getType();

	/**
	 * Sets the value of the '{@link scenario.Divergence#getType <em>Type</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Type</em>' attribute.
	 * @see scenario.DivergenceType
	 * @see #getType()
	 * @generated
	 */
	void setType(DivergenceType value);

	/**
	 * Returns the value of the '<em><b>Schedules</b></em>' containment reference list.
	 * The list contents are of type {@link scenario.Schedule}.
	 * It is bidirectional and its opposite is '{@link scenario.Schedule#getParent <em>Parent</em>}'.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Schedules</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Schedules</em>' containment reference list.
	 * @see scenario.ScenarioPackage#getDivergence_Schedules()
	 * @see scenario.Schedule#getParent
	 * @model opposite="parent" containment="true" lower="2"
	 * @generated
	 */
	EList<Schedule> getSchedules();

} // Divergence
