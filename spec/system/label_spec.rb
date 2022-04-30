require 'rails_helper'
RSpec.describe 'Label test',type: :system do
    describe 'While testing Label functions' do
        before do
     @user=FactoryBot.create(:user, name: 'test',email: 'test@gmail.com',password: '111111')
          @task1 = FactoryBot.create(:task)
          @task2 = FactoryBot.create(:second_task)
          @task3 = FactoryBot.create(:third_task)
          label=Label.create(name:'A',user_id:nil,id: 1)
          labeling = FactoryBot.create(:labeling1)
          visit new_session_path
          fill_in 'session[email]', with: 'test@gmail.com'
          fill_in 'session[password]', with: '111111'
          click_button 'signin'
        end
        context 'Create new task' do
          it 'Labels are displayed' do
            visit new_session_path
            expect(page).to have_content 'A'
          end
          it 'create new task and add tag' do
            visit new_task_path
            fill_in 'task[title]', with: 'task'
            fill_in 'task[content]', with: 'new task detail'
            find(:css, "#task_label_ids_1").set(true)
            click_on 'Create Task'
            expect(page).to have_content 'task'
          end
         it 'You can search by label' do
            visit tasks_path
            select 'A',from: 'search_label'
            click_on 'search'
            expect(page).to have_content 'title_test'
          end
         end
      end
end
