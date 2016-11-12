using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ParallelTests
{
    [TestFixture]
    public class TestClass
    {
        [Test]
        [Category("C1")]
        public void TestMethod1()
        {
            Assert.Pass("Your first passing test");
            //random change
        }

        [Test]
        [Category("C2")]
        public void TestMethod2()
        {
            Assert.Pass("Your first passing test");
        }

        [Test]
        [Category("C3")]
        public void TestMethod3()
        {
            Assert.Pass("Your first passing test");
        }
        [Test]
        [Category("C4")]

        public void TestMethod4()
        {
            Assert.Pass("Your first passing test");
        }
    }
}
