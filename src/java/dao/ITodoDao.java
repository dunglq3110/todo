package dao;

import model.Todo;

import java.util.List;

public interface ITodoDao {

    void addTodo(Todo todo);

    Todo getTodo(long todoId);

    List<Todo> getAllTodos();

    boolean deleteTodo (long id);

    boolean updateTodo(Todo todo);
}
