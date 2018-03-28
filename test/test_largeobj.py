# Copyright (c) 2015, Facebook, Inc.
#
# This source code is licensed under the MIT license found in the LICENSE
# file in the root directory of this source tree.

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

from mcrouter.test.McrouterTestCase import McrouterTestCase
from mcrouter.test.mock_servers import StoreServer

class TestLargeObj(McrouterTestCase):
    config = './mcrouter/test/test_largeobj.json'
    extra_args = []
    value_size = 1024 * 1024 * 2 + 1

    def setUp(self):
        self.add_server(StoreServer('test_largeobj', 'x' * self.value_size))
        self.mcrouter = self.add_mcrouter(
            self.config,
            extra_args=self.extra_args)

    def test_largeobj(self):
        string_x = 'x' * self.value_size
        resp = self.mcrouter.set('test_largeobj', string_x)
        self.assertTrue(resp)
