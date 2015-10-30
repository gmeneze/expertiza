require 'rails_helper'
require 'spec_helper'

def GenerateAssignmentName()
  (rand(1000) + 1).to_s + 'SpecID' + (1 + rand(1000)).to_s
end

RSpec.feature "create public assignment"  do
    before(:each) do
      #@user = FactoryGirl.create(:user)
      visit root_path
      fill_in('login_name', :with => 'instructor6')
      fill_in('login_password', :with => 'password')
      click_on('SIGN IN')
      expect(page).to have_content('Manage')
      within(".content") do
        click_on("Assignments")
      end
    end
	scenario "Create Assignment has teams",:js => true  do        
	      click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('team_assignment')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
	end

  scenario "Create Assignment has quiz",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_form_assignment_require_quiz')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end

  scenario "Create Assignment has Wiki Assignment",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_wiki_assignment')
        check('assignment_form_assignment_availability_flag')
        select('MediaWiki',from: 'assignment_form_assignment_wiki_type_id')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end

  #scenario "Create Assignment has Staggered deadline assignment",:js => true  do        
  #      click_button 'New public assignment'
  #      fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
  #      select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
  #      fill_in('assignment_form_assignment_directory_path',:with => '/')
  #      fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
  #      check('assignment_form_assignment_staggered_deadline')
  #      page.driver.browser.switch_to.alert.accept
  #      check('assignment_form_assignment_availability_flag')
  #      #find(:xpath, "//input[@id='']").set "0"
  #      click_on('Create')
  #      click_on('Rubrics')

  #      within('#questionnaire_table_ReviewQuestionnaire') do
  #        select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
  #      end

  #      within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
  #        select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
  #      end

  #      expect(page).to have_content("Rubrics")
  #      click_on('submit_btn')
  #      expect(page).to have_content("successfully",:wait=>5)
  #end

  scenario "Create Assignment has Micro-task assignment",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_form_assignment_microtask')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end

  scenario "Create Assignment has Reviews visible to all other reviewers",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_form_assignment_reviews_visible_to_all')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end
  scenario "Create Assignment has Is code submission required",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_form_assignment_is_coding_assignment')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end
end

RSpec.feature "create Assignment with 2 Option"  do
    before(:each) do
      #@user = FactoryGirl.create(:user)
      visit root_path
      fill_in('login_name', :with => 'instructor6')
      fill_in('login_password', :with => 'password')
      click_on('SIGN IN')
      expect(page).to have_content('Manage')
      within(".content") do
        click_on("Assignments")
      end
    end
  scenario "Create Assignment has teams and quiz",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('team_assignment')
        check('assignment_form_assignment_availability_flag')
        check('assignment_form_assignment_require_quiz')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end

  #scenario "Create Assignment has Wiki Assignment and Staggered Deadline",:js => true  do        
  #      click_button 'New public assignment'
  #      fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
  #      select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
  #      fill_in('assignment_form_assignment_directory_path',:with => '/')
  #      fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
 #       check('assignment_wiki_assignment')
 #       check('assignment_form_assignment_staggered_deadline')
 #       page.driver.browser.switch_to.alert.accept
 #       check('assignment_form_assignment_availability_flag')
 #       select('MediaWiki',from: 'assignment_form_assignment_wiki_type_id')
  #      #find(:xpath, "//input[@id='']").set "0"
   #     click_on('Create')
    #    click_on('Rubrics')

    #    within('#questionnaire_table_ReviewQuestionnaire') do
    #      select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
    #    end

    #    within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
    #      select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
    #    end

     #   expect(page).to have_content("Rubrics")
     #   click_on('submit_btn')
     #   expect(page).to have_content("successfully",:wait=>5)
  #end

  scenario "Create Assignment has MicroTask and Review visible",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_form_assignment_reviews_visible_to_all')
        check('assignment_form_assignment_microtask')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end

  scenario "Create Assignment has Code Submission",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_form_assignment_is_coding_assignment')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end

  scenario "Create Assignment has Reviews visible to all other reviewers",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_wiki_assignment')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end
  scenario "Create Assignment has Is code submission required",:js => true  do        
        click_button 'New public assignment'
        fill_in('assignment_form_assignment_name',:with => GenerateAssignmentName())
        select('CSC 517 Fall 2010', from: 'assignment_form_assignment_course_id')
        fill_in('assignment_form_assignment_directory_path',:with => '/')
        fill_in('assignment_form_assignment_spec_location',:with => 'google.com')
        check('assignment_wiki_assignment')
        check('assignment_form_assignment_availability_flag')
        #find(:xpath, "//input[@id='']").set "0"
        click_on('Create')
        click_on('Rubrics')

        within('#questionnaire_table_ReviewQuestionnaire') do
          select('Animation', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        within('#questionnaire_table_AuthorFeedbackQuestionnaire') do
          select('Author feedback OTD1', from: 'assignment_form[assignment_questionnaire][][questionnaire_id]')
        end

        expect(page).to have_content("Rubrics")
        click_on('submit_btn')
        expect(page).to have_content("successfully",:wait=>5)
  end
end


RSpec.feature "create public assignment"  do
    before(:each) do
      #@user = FactoryGirl.create(:user)
      visit root_path
      fill_in('login_name', :with => 'instructor6')
      fill_in('login_password', :with => 'password')
      click_on('SIGN IN')
      expect(page).to have_content('Manage')
      within(".content") do
        click_on("Assignments")
      end
    end
  scenario "Create Assignment has teams",:js => true  do        

  end
end