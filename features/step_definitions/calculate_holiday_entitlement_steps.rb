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