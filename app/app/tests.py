from django.test import SimpleTestCase
from app import calc

class SampleTest(SimpleTestCase):
    def test_add(self):
        res = calc.add(5, 6)
        self.assertEqual(res, 11)

    def test_substract(self):
        res = calc.substract(10, 20)
        self.assertEqual(res, 10)