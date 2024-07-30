#############    SCENERIO 1     #############   


And('I should see the page useful form') do 
  expect(page).to have_css('div.gem-c-feedback__prompt-content')
end


#############    SCENERIO 2     #############   


And('I should see a yes button') do 
  within('div.gem-c-feedback__prompt-content') do
    yes_button = all('button.govuk-button')[0]
    expect(yes_button.text).to eq('Yes')
  end
end

When('I click the yes button') do
  within('div.gem-c-feedback__prompt-content') do
    yes_button = all('button.govuk-button')[0]
    expect(yes_button.text).to eq('Yes')
  end
end

Then('A thank you for your response message appears') do 
  within('div.gem-c-feedback__prompt-content') do
    alert = find('div.gem-c-feedback__prompt-success')
    expect(alert.text).to eq('Thank you for your feedback')
  end
end


#############    SCENERIO 3     #############  


And('I should see a no button') do 
  within('div.gem-c-feedback__prompt-content') do
    no_button = all('button.govuk-button')[1]
    expect(no_button.text).to eq('No')
  end
end

When('I click the no button') do
  within('div.gem-c-feedback__prompt-content') do
    no_button = all('button.govuk-button')[1]
    no_button.click
  end
end

Then('A help us improve GOV.UK message appearts') do 
  within('#survey-wrapper') do
    alert = find('h3.gem-c-feedback__form-heading')
    expect(alert.text).to eq('Help us improve GOV.UK')
  end
end


#############    SCENERIO 4     #############  


And('I should see a report button') do 
  within('div.gem-c-feedback__prompt-content') do
    no_button = all('button.govuk-button')[2]
    expect(no_button.text.strip).to eq('Report a problem with this page')
  end
end

When('I click report button') do
  within('div.gem-c-feedback__prompt-content') do
    report_button = all('button.govuk-button')[2]
    report_button.click
  end
end

Then('a report form shows') do
  expect(page).to have_selector('form')
end

And('I input tester123 in what were you doing field') do
  fill_in 'what_doing', with: 'tester123'
end

And('I input tester456 in what went wrong field') do
  fill_in 'what_wrong', with: 'tester456'
end

And('send button exists') do
  form = find('form#something-is-wrong')
  button = form.all('button')[0]
  expect(button.text).to eq('Send')
end

And('I click Send') do
  form = find('form#something-is-wrong')
  button = form.all('button')[0]
  button.click
end
