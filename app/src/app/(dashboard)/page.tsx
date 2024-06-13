import Link from "next/link"
import Image from "next/image"
import { photo } from "@/images/index"

export default function Page() {
  return (
    <div className="flex flex-col min-h-screen">
      <header className="bg-[#003366] text-white py-4 px-6 flex items-center justify-between">
        <Link href="#">
      <Image src={photo} alt="an image"/>
        </Link>
        <nav className="flex items-center gap-6">
          <Link className="hover:underline" href="/sign-in">
            Login
          </Link>
          <Link className="hover:underline" href="/sign-up">
            Register
          </Link>
          <Link className="hover:underline" href="/">
            Dashboard
          </Link>
        </nav>
      </header>
      <main className="flex-1">
        <section className="bg-[#f5f5f5] py-20">
          <div className="container mx-auto px-4 md:px-8">
            <h1 className="text-4xl font-bold mb-4">Welcome to the University of Ghana Engineering Students Portal</h1>
            <p className="text-lg text-gray-700 mb-8">
              Explore the latest news, events, and resources for engineering students.
            </p>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div>
                <h2 className="text-2xl font-bold mb-4">Announcements</h2>
                <ul className="space-y-4">
                  <li>
                    <h3 className="text-xl font-semibold">Engineering Career Fair</h3>
                    <p className="text-gray-700">Join us for the annual Engineering Career Fair on May 15th.</p>
                  </li>
                  <li>
                    <h3 className="text-xl font-semibold">New Engineering Lab Equipment</h3>
                    <p className="text-gray-700">
                      The university has acquired new state-of-the-art equipment for the engineering labs.
                    </p>
                  </li>
                  <li>
                    <h3 className="text-xl font-semibold">Engineering Student Hackathon</h3>
                    <p className="text-gray-700">
                      Participate in the upcoming Engineering Student Hackathon on June 10th.
                    </p>
                  </li>
                </ul>
              </div>
              <div>
                <h2 className="text-2xl font-bold mb-4">Courses</h2>
                <ul className="space-y-4">
                  <li>
                    <h3 className="text-xl font-semibold">Introduction to Computer Engineering</h3>
                    <p className="text-gray-700">Explore the fundamentals of computer hardware and software design.</p>
                  </li>
                  <li>
                    <h3 className="text-xl font-semibold">Principles of Electrical Engineering</h3>
                    <p className="text-gray-700">
                      Learn the core concepts of electrical circuits, power systems, and electronics.
                    </p>
                  </li>
                  <li>
                    <h3 className="text-xl font-semibold">Structural Analysis and Design</h3>
                    <p className="text-gray-700">
                      Develop skills in analyzing and designing structures for civil engineering projects.
                    </p>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </section>
      </main>
      <footer className="bg-[#003366] text-white py-6 px-6 text-center">
        <p>© 2024 University of Ghana</p>
      </footer>
    </div>
  )
}
