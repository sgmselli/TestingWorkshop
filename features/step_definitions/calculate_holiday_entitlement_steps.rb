


#############    SCENERIO 1     #############   


Given('I navigate to the homepage') do 
    visit 'https://www.gov.uk/calculate-your-holiday-entitlement'
    sleep 1
end

And('I should see the homepage') do
    expect(page).to have_title 'Calculate holiday entitlement - GOV.UK'
    expect(page).to have_css 'h1.govuk-heading-xl'
    expect(page).to have_link 'Start now'
    expect(page).to have_content 'Use this tool to calculate holiday entitlement for:'
end


#############    SCENERIO 2     #############


When ("I click on the 'Start now' button") do
    click_link('Start now')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y'
end

And("I select the option no for working irregular hours") do
    choose('No', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular'
end

And ('I select the option hours worked per week') do
    choose('hours worked per week', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week'
end

And ('I select the option for a full leave year') do
    choose('for a full leave year', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year'
end

And ('I input 37.5 hours worked per week') do
    fill_in 'response', with: '37.5'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year/37.5'
end

And ('I input 5 days worked per week') do
    fill_in 'response', with: '5'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year/37.5/5.0'
end

Then ('I should see the correct submitted answers for regular hours') do
    within('div.gem-c-summary-list') do
        expect(page).to have_css('dd.govuk-summary-list__value', text: 'No')
        expect(page).to have_css('dd.govuk-summary-list__value', text: 'hours worked per week')
        expect(page).to have_css('dd.govuk-summary-list__value', text: 'for a full leave year')
        expect(page).to have_css('dd.govuk-summary-list__value', text: '37.5')
        expect(page).to have_css('dd.govuk-summary-list__value', text: '5.0')
    end
end

And ('I should see 210 total entitlement hours') do
    expect(page).to have_content 'The statutory entitlement is 210 hours holiday.'
end


#############    SCENERIO 3     #############


And("I select the option yes for working irregular hours") do
    choose('Yes', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/irregular-hours-and-part-year'
end

And("I input the date 08-07-2024") do
    fill_in 'response-0', with: '08'
    fill_in 'response-1', with: '07'
    fill_in 'response-2', with: '2024'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/irregular-hours-and-part-year/2024-07-08'
end

And("I input 50 hours worked in the pay period") do
    fill_in 'response', with: '50' 
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/irregular-hours-and-part-year/2024-07-08/50.0'
end

Then ('I should see the correct submitted answers for irregular hours') do
    within('div.gem-c-summary-list') do
        expect(page).to have_css('dd.govuk-summary-list__value', text: 'Yes')
        expect(page).to have_css('dd.govuk-summary-list__value', text: '8 July 2024')
        expect(page).to have_css('dd.govuk-summary-list__value', text: '50.0')
    end
end

And ('I should see 6 total entitlement hours') do
    expect(page).to have_content 'The statutory entitlement for this pay period is 6 hours.'
end


#############    SCENERIO 4     #############

