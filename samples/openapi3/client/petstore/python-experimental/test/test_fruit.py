# coding: utf-8

"""
    OpenAPI Petstore

    This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\  # noqa: E501

    The version of the OpenAPI document: 1.0.0
    Generated by: https://openapi-generator.tech
"""


from __future__ import absolute_import

import unittest

import petstore_api


class TestFruit(unittest.TestCase):
    """Fruit unit test stubs"""

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def testFruit(self):
        """Test Fruit"""

        # make an instance of Fruit, a composed schema oneOf model
        # banana test
        length_cm = 20.3
        color = 'yellow'
        fruit = petstore_api.Fruit(length_cm=length_cm, color=color)
        # check its properties
        self.assertEqual(fruit.length_cm, length_cm)
        self.assertEqual(fruit['length_cm'], length_cm)
        self.assertEqual(getattr(fruit, 'length_cm'), length_cm)
        self.assertEqual(fruit.color, color)
        self.assertEqual(fruit['color'], color)
        self.assertEqual(getattr(fruit, 'color'), color)
        # check the dict representation
        self.assertEqual(
            fruit.to_dict(),
            {
                'length_cm': length_cm,
                'color': color
            }
        )
        # setting a value that doesn't exist raises an exception
        # with a key
        with self.assertRaises(petstore_api.ApiKeyError):
            fruit['invalid_variable'] = 'some value'
        # with setattr
        with self.assertRaises(petstore_api.ApiKeyError):
            setattr(fruit, 'invalid_variable', 'some value')

        # getting a value that doesn't exist raises an exception
        # with a key
        with self.assertRaises(petstore_api.ApiKeyError):
            invalid_variable = fruit['cultivar']
        # with getattr
        with self.assertRaises(petstore_api.ApiKeyError):
            invalid_variable = getattr(fruit, 'cultivar', 'some value')

        # make sure that the ModelComposed class properties are correct
        # model.composed_schemas() stores the anyOf/allOf/oneOf info
        self.assertEqual(
            fruit._composed_schemas(),
            {
                'anyOf': [],
                'allOf': [],
                'oneOf': [
                    petstore_api.Apple,
                    petstore_api.Banana,
                ],
            }
        )
        # model._composed_instances is a list of the instances that were
        # made from the anyOf/allOf/OneOf classes in model._composed_schemas()
        for composed_instance in fruit._composed_instances:
            if composed_instance.__class__ == petstore_api.Banana:
                banana_instance = composed_instance
        self.assertEqual(
            fruit._composed_instances,
            [banana_instance]
        )
        # model._var_name_to_model_instances maps the variable name to the
        # model instances which store that variable
        self.assertEqual(
            fruit._var_name_to_model_instances,
            {
                'color': [fruit],
                'length_cm': [fruit, banana_instance],
                'cultivar': [fruit],
            }
        )
        # model._additional_properties_model_instances stores a list of
        # models which have the property additional_properties_type != None
        self.assertEqual(
            fruit._additional_properties_model_instances, []
        )

        # if we modify one of the properties owned by multiple
        # model_instances we get an exception when we try to access that
        # property because the retrieved values are not all the same
        banana_instance.length_cm = 4.56
        with self.assertRaises(petstore_api.ApiValueError):
            some_length_cm = fruit.length_cm

        # including extra parameters raises an exception
        with self.assertRaises(petstore_api.ApiValueError):
            fruit = petstore_api.Fruit(
                color=color,
                length_cm=length_cm,
                unknown_property='some value'
            )

        # including input parameters for two oneOf instances raise an exception
        with self.assertRaises(petstore_api.ApiValueError):
            fruit = petstore_api.Fruit(
                length_cm=length_cm,
                cultivar='granny smith'
            )

        # make an instance of Fruit, a composed schema oneOf model
        # apple test
        color = 'red'
        cultivar = 'golden delicious'
        fruit = petstore_api.Fruit(color=color, cultivar=cultivar)
        # check its properties
        self.assertEqual(fruit.color, color)
        self.assertEqual(fruit['color'], color)
        self.assertEqual(getattr(fruit, 'color'), color)
        self.assertEqual(fruit.cultivar, cultivar)
        self.assertEqual(fruit['cultivar'], cultivar)
        self.assertEqual(getattr(fruit, 'cultivar'), cultivar)
        # check the dict representation
        self.assertEqual(
            fruit.to_dict(),
            {
                'color': color,
                'cultivar': cultivar
            }
        )

        # model._composed_instances is a list of the instances that were
        # made from the anyOf/allOf/OneOf classes in model._composed_schemas()
        for composed_instance in fruit._composed_instances:
            if composed_instance.__class__ == petstore_api.Apple:
                apple_instance = composed_instance
        self.assertEqual(
            fruit._composed_instances,
            [apple_instance]
        )
        # model._var_name_to_model_instances maps the variable name to the
        # model instances which store that variable
        self.assertEqual(
            fruit._var_name_to_model_instances,
            {
                'color': [fruit],
                'length_cm': [fruit],
                'cultivar': [fruit, apple_instance],
            }
        )
        # model._additional_properties_model_instances stores a list of
        # models which have the property additional_properties_type != None
        self.assertEqual(
            fruit._additional_properties_model_instances, []
        )

if __name__ == '__main__':
    unittest.main()
