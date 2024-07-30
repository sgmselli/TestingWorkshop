
And('I input more than 168 hours worked per week') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year'
    fill_in 'response', with: '169'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year?response=169&next=1'
end

Then('I should see an error message') do
    within('div.error-summary') do
    expect(page).to have_content 'error-c35a9503'
    end
    within('div.govuk-form-group govuk-form-group--error') do
    expect(page).to have_content 'error-c35a9503'
    end
end


