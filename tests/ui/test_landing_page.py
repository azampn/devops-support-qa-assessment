import os

from playwright.sync_api import expect


def test_landing_page_branding_and_pricing_flow(page):
    base_url = os.getenv("BASE_URL", "http://127.0.0.1:5000")

    page.goto(base_url)

    expect(page).to_have_title("MyTemplate")
    expect(page.get_by_text("Batteries Included")).to_be_visible()

    pricing_link = page.get_by_role("link", name="Pricing")
    expect(pricing_link).to_be_visible()

    pricing_link.click(force=True)

    expect(page.locator("#pricing")).to_be_visible()
