package service;

import entity.StudentId;
import javax.persistence.*;

public class ExternalService {

    EntityManager em;

    public ExternalService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public StudentId findStudentByStudentId(String studentId) {
        return (StudentId) em.createNamedQuery("StudentId.findByStudentId")
                .setParameter("studentId", studentId)
                .getSingleResult();
    }

    public boolean isStudentIdIDExist(String useridcard) {
        int count = (int) em.createNativeQuery(
                "SELECT COUNT(si.STUDENT_ID) "
                + "FROM STUDENT_ID si "
                + "WHERE si.ID = '" + useridcard + "'")
                .getSingleResult();
        return (count == 1);
    }

    public void close() {
        this.em.close();
    }
}
