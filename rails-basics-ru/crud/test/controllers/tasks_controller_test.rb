require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
     @task = Task.new(
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      status: Faker::Subscription.status,
      creator: Faker::Lorem.sentence,
      performer: Faker::Superhero.name,
      completed: Faker::Boolean.boolean,
    )
  end

  def test_read_task
    @task.save

    task = Task.find(@task.id)

    assert_equal @task.name, task.name
    assert_equal @task.description, task.description
  end

  def test_update_task
    @task.save

    @task.name = Faker::Lorem.sentence
    @task.save

    task = Task.find(@task.id)

    assert_equal @task.name, task.name
    assert_equal @task.completed, task.completed
  end
end
