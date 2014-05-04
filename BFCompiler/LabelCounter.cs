// --------------------------------------------------------------------------------------------------------------------
// <copyright company="" file="LabelCounter.cs">
//   
// </copyright>
// <summary>
//   The label counter.
// </summary>
// 
// --------------------------------------------------------------------------------------------------------------------
namespace BFCompiler
{
    using System;
    using System.Collections.Generic;

    /// <summary>
    ///   The label counter.
    /// </summary>
    public class LabelCounter
    {
        /// <summary>
        /// The end labels.
        /// </summary>
        private readonly Stack<int> endLabels = new Stack<int>();

        /// <summary>
        ///   The labels.
        /// </summary>
        private readonly Stack<int> startLabels = new Stack<int>();

        /// <summary>
        ///   The i.
        /// </summary>
        private int i = -1;

        /// <summary>
        /// The gen next.
        /// </summary>
        public void GenNext()
        {
            this.i += 1;
            this.startLabels.Push(this.i);

            this.i += 1;
            this.endLabels.Push(this.i);
        }

        /// <summary>
        /// The pop end.
        /// </summary>
        /// <returns>
        /// The <see cref="string"/>.
        /// </returns>
        public string PopEnd()
        {
            return string.Format("label{0}", this.endLabels.Pop());
        }

        /// <summary>
        /// The pop start.
        /// </summary>
        /// <returns>
        /// The <see cref="string"/>.
        /// </returns>
        public string PopStart()
        {
            return string.Format("label{0}", this.startLabels.Pop());
        }

        /// <summary>
        /// The top end.
        /// </summary>
        /// <returns>
        /// The <see cref="string"/>.
        /// </returns>
        public string TopEnd()
        {
            return string.Format("label{0}", this.endLabels.Peek());
        }

        /// <summary>
        /// The top start.
        /// </summary>
        /// <returns>
        /// The <see cref="string"/>.
        /// </returns>
        public string TopStart()
        {
            return string.Format("label{0}", this.startLabels.Peek());
        }
    }
}
