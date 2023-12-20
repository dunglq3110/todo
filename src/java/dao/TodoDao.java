package dao;

import model.Todo;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

public class TodoDao implements ITodoDao {

    public static EntityManagerFactory emf = Persistence.createEntityManagerFactory("todolistPU");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    @Override
    public void addTodo(Todo todo) {
        EntityManager em = getEntityManager();
        em.getTransaction().begin();
        em.persist(todo);
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public Todo getTodo(long todoId) {
        EntityManager em = getEntityManager();
        em.getTransaction().begin();
        TypedQuery<Todo> query = em.createQuery("SELECT todo FROM Todo todo WHERE id = :id", Todo.class);
        query.setParameter("id", todoId);
        Todo todo = query.getSingleResult();
        em.getTransaction().commit();
        em.close();
        return todo;
    }

    @Override
    public List<Todo> getAllTodos() {
        List<Todo> todos = new ArrayList<>();
        EntityManager em = getEntityManager();
        em.getTransaction().begin();
        TypedQuery<Todo> query = em.createQuery("SELECT todo FROM Todo todo", Todo.class);
        todos.addAll(query.getResultList());
        em.getTransaction().commit();
        em.close();
        return todos;
    }

    @Override
    public boolean deleteTodo(long id) {
        boolean rowDeleted;
        EntityManager em = getEntityManager();
        em.getTransaction().begin();
        Query query = em.createQuery("DELETE FROM Todo WHERE id = :id");
        query.setParameter("id", id);
        rowDeleted = query.executeUpdate() > 0;
        em.getTransaction().commit();
        em.close();
        return rowDeleted;
    }

    @Override
    public boolean updateTodo(Todo todo) {
        boolean rowUpdated;
        EntityManager em = getEntityManager();
        em.getTransaction().begin();
        Query query = em.createQuery("UPDATE Todo SET title = :newTitle, " +
                                             "username = :newUsername, " +
                                             "description = :newDescription, " +
                                             "target_date = :newTargetDate, " +
                                             "is_done = :newStatus WHERE id = :id");
        query.setParameter("newTitle", todo.getTitle())
                .setParameter("newUsername", todo.getUsername())
                .setParameter("newDescription", todo.getDescription())
                .setParameter("newTargetDate", todo.getTargetDate())
                .setParameter("newStatus", todo.getStatus())
                .setParameter("id", todo.getId());
        rowUpdated = query.executeUpdate() > 0;
        em.getTransaction().commit();
        em.close();
        return rowUpdated;
    }
}
