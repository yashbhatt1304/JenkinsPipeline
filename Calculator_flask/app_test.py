import pytest
from app import app

@pytest.fixture
def testClient():
    app.testing = True
    return app.test_client()

def test_home(testClient):
    response = testClient.get('/')
    assert response.status_code == 200
