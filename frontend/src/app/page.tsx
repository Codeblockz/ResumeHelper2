export default function HomePage() {
  return (
    <div className="min-h-screen">
      {/* Hero Section */}
      <section className="bg-gradient-to-br from-primary-50 to-primary-100 py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center">
            <h1 className="text-4xl md:text-6xl font-bold text-gray-900 mb-6">
              Tailor Your Resume with{' '}
              <span className="text-primary-600">AI Power</span>
            </h1>
            <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
              Transform any resume to match job requirements perfectly. Our AI analyzes 
              job descriptions and optimizes your resume for ATS compatibility and maximum impact.
            </p>
            <div className="space-y-4 sm:space-y-0 sm:space-x-4 sm:flex sm:justify-center">
              <button className="btn-primary px-8 py-3 text-lg">
                Start Tailoring
              </button>
              <button className="btn-secondary px-8 py-3 text-lg">
                Learn More
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              Why Choose Resume Tailor?
            </h2>
            <p className="text-xl text-gray-600 max-w-2xl mx-auto">
              Powered by local AI processing to keep your data private and secure
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-8">
            {/* Feature 1 */}
            <div className="card text-center">
              <div className="card-body">
                <div className="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4">
                  <svg className="w-8 h-8 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold mb-3">ATS Optimized</h3>
                <p className="text-gray-600">
                  Ensure your resume passes through Applicant Tracking Systems with 
                  optimized formatting and keyword placement.
                </p>
              </div>
            </div>

            {/* Feature 2 */}
            <div className="card text-center">
              <div className="card-body">
                <div className="w-16 h-16 bg-success-100 rounded-full flex items-center justify-center mx-auto mb-4">
                  <svg className="w-8 h-8 text-success-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold mb-3">Private & Secure</h3>
                <p className="text-gray-600">
                  Your resume data stays on your device. All AI processing happens 
                  locally with no cloud storage required.
                </p>
              </div>
            </div>

            {/* Feature 3 */}
            <div className="card text-center">
              <div className="card-body">
                <div className="w-16 h-16 bg-warning-100 rounded-full flex items-center justify-center mx-auto mb-4">
                  <svg className="w-8 h-8 text-warning-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold mb-3">Lightning Fast</h3>
                <p className="text-gray-600">
                  Get your tailored resume in under 30 seconds. Powered by 
                  state-of-the-art local AI models.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="bg-primary-600 py-16">
        <div className="max-w-4xl mx-auto text-center px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
            Ready to Land Your Dream Job?
          </h2>
          <p className="text-xl text-primary-100 mb-8">
            Join thousands of job seekers who have improved their interview rates with AI-tailored resumes.
          </p>
          <button className="btn bg-white text-primary-600 hover:bg-primary-50 px-8 py-3 text-lg font-semibold">
            Get Started for Free
          </button>
        </div>
      </section>
    </div>
  )
}