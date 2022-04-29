require 'rails_helper'

  RSpec.describe 'Task management function', type: :model do

    it 'If the title is empty, validation will not pass' do
        task = Task.new(title: '', content: 'deatisl blabla', deadline: DateTime.now, status:'pending', priority:'low')
       expect(task).not_to be_valid
    end

    it 'If the content is empty, validation will not pass' do
        task = Task.new(title: 'sommething', content: '', deadline:DateTime.now+1, status:'started', priority:'high')
        expect(task).not_to be_valid
    end

    it 'If the task content and details are described validation will pass' do
        task = Task.new(title: 'this is', content: 'very good.', deadline: DateTime.now+2, status:'started', priority:'low')
        expect(task).to be_valid
    end

    describe 'You can search with the scope method' do
      
        before do
          @task0 = FactoryBot.create(:task, title: 'task', content: 'something', deadline:DateTime.now, status:'started', priority:'low')
          @task1 = FactoryBot.create(:task, title: 'task', content: 'something1', deadline:DateTime.now, status:'pending', priority:'low')
          @task2 = FactoryBot.create(:task, title: 'task', content: 'something2', deadline:DateTime.now, status:'completed', priority:'medium')
        end

        it 'You can search for titles' do
          expect(Task.search_sort('task')).to include(@task0)
        end

        it 'You can search the status' do
          expect(Task.status_sort('pending')).to include(@task1)
        end

        it 'You can search the priority' do
          expect(Task.priority_sort('medium')).to include(@task2)
        end

        it 'You can search for both title and status' do
          expect(Task.search_sort('task').status_sort('completed')).to include(@task2)
        end
      end
end
