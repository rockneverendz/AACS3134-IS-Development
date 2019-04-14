package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "STUDENT_ID")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentId.findAll", query = "SELECT s FROM StudentId s"),
    @NamedQuery(name = "StudentId.findByStudentId", query = "SELECT s FROM StudentId s WHERE s.studentId = :studentId"),
    @NamedQuery(name = "StudentId.findById", query = "SELECT s FROM StudentId s WHERE s.id = :id")})
public class StudentId implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "STUDENT_ID")
    private Integer studentId;
    @Basic(optional = false)
    @Column(name = "ID")
    private int id;

    public StudentId() {
    }

    public StudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public StudentId(Integer studentId, int id) {
        this.studentId = studentId;
        this.id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (studentId != null ? studentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StudentId)) {
            return false;
        }
        StudentId other = (StudentId) object;
        if ((this.studentId == null && other.studentId != null) || (this.studentId != null && !this.studentId.equals(other.studentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.StudentId[ studentId=" + studentId + " ]";
    }

}