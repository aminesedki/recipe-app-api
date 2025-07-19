from django.test import SimpleTestCase
from app import calc


class CalcTests(SimpleTestCase):
    def test_add_numbers(self):
        """Test adding numbers together."""
        res = calc.add(1, 2)
        expected = 3
        self.assertEqual(res, expected)

    def test_subtract_numbers(self):
        """Test subtracting numbers."""
        res = calc.subtract(3, 2)
        expected = 1
        self.assertEqual(res, expected)
