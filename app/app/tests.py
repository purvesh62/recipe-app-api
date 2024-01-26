"""
Sample tests
"""

from django.test import SimpleTestCase


class CalcTests(SimpleTestCase):
    def test_add_numbersx(self):
        """Test that two numbers are added together"""
        self.assertEqual(
            5 + 8,
            13
        )
