And('I input 169 hours worked per week') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year'
    fill_in 'response', with: '169'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year?response=169&next=1'
end

Then('I should see a more than error message') do
    expect(page).to have_content 'There is a problem'
    within('li.gem-c-error-summary__list-item') do
    expect(page).to have_content 'You can enter a maximum of 168 hours per week. Do not enter fractions. If you work half-hours, enter .5 for half. For example, 40.5'
    end
    within('div.govuk-form-group--error') do
    expect(page).to have_content 'You can enter a maximum of 168 hours per week. Do not enter fractions. If you work half-hours, enter .5 for half. For example, 40.5'
    end
end

And('I input less than 0.1 hours worked per week') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year'
    fill_in 'response', with: '0'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year?response=0&next=1'
end

Then('I should see a less than error message') do
    expect(page).to have_content 'There is a problem'
    within('li.gem-c-error-summary__list-item') do
    expect(page).to have_content 'Please enter at least .5 hours worked. Do not enter fractions. If you work half-hours, enter .5 for half. For example, 40.5'
    end
    within('div.govuk-form-group--error') do
    expect(page).to have_content 'Please enter at least .5 hours worked. Do not enter fractions. If you work half-hours, enter .5 for half. For example, 40.5'
    end
end

And('I input 168 hours worked per week') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year'
    fill_in 'response', with: '168'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year/168.0'
end

And('I input 1 days worked per week') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year/168.0'
    fill_in 'response', with: '1'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year/168.0?response=1&next=1'
end

Then('I should see a too many hours error message') do
    expect(page).to have_content 'There is a problem'
    within('li.gem-c-error-summary__list-item') do
    expect(page).to have_content 'There are only 24 hours per day. Please check and enter a correct value.'
    end
    within('div.govuk-form-group--error') do
    expect(page).to have_content 'There are only 24 hours per day. Please check and enter a correct value.'
    end
end

And('I input 8 days worked per week') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year/168.0'
    fill_in 'response', with: '8'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year/168.0?response=8&next=1'
end

Then('I should see a too many days error message') do
    expect(page).to have_content 'There is a problem'
    within('li.gem-c-error-summary__list-item') do
    expect(page).to have_content 'There are only 7 days in a week. Please check and enter a correct value.'
    end
    within('div.govuk-form-group--error') do
    expect(page).to have_content 'There are only 7 days in a week. Please check and enter a correct value.'
    end
end

And('I select the option for someone leaving part way through a leave year') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week'
    choose('for someone leaving part way through a leave year', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/leaving'
end

And('I input 08,07,2024 for the employment end date') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/leaving'
    fill_in 'response-0', with: '08'
    fill_in 'response-1', with: '07'
    fill_in 'response-2', with: '2024'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/leaving/2024-07-08'
end

And('I input 09,07,2024 for the leave year start') do
    fill_in 'response-0', with: '09'
    fill_in 'response-1', with: '07'
    fill_in 'response-2', with: '2024'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/leaving/2024-07-08?response%5Bday%5D=09&response%5Bmonth%5D=07&response%5Byear%5D=2024&next=1'
end

Then('I should see an incorrect early date error message') do
    expect(page).to have_content 'There is a problem'
    within('li.gem-c-error-summary__list-item') do
    expect(page).to have_content 'Your leave year start date must be earlier than your employment end date of 08 July 2024.'
    end
    within('div.govuk-form-group--error') do
    expect(page).to have_content 'Your leave year start date must be earlier than your employment end date of 08 July 2024.'
    end
end

And('I select the option shifts') do
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular'
    choose('shifts', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/shift-worker'
end

And('I select the option for a full leave year for shift work') do
    choose('for a full leave year', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/shift-worker/full-year'
end

And('I input 25 hours for the shifts') do
    fill_in 'response', with: '25'
    click_button('Continue')
    expect(page).to have_current_path 'https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/shift-worker/full-year?response=25&next=1'
end

Then('I should see an incorrect shift length error message') do
    expect(page).to have_content 'There is a problem'
    within('li.gem-c-error-summary__list-item') do
    expect(page).to have_content '24 is the maximum number of hours per shift. Do not enter fractions. If you work half-hours, enter .5 for half. For example 4.5'
    end
    within('div.govuk-form-group--error') do
    expect(page).to have_content '24 is the maximum number of hours per shift. Do not enter fractions. If you work half-hours, enter .5 for half. For example 4.5'
    end
end

