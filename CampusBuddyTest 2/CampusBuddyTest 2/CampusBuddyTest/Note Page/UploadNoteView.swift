//
//  UploadNotesView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 12/08/2026.
//

import SwiftUI
import UniformTypeIdentifiers

struct UploadNotesView: View {
    
    // MARK: - Form Data
    
    @State private var notesTitle = ""
    @State private var subject = ""
    @State private var notesDescription = ""
    
    @State private var showingFilePicker = false
    @State private var selectedFileName = ""
    @State private var selectedFileSize = ""
    @State private var sharingOption = "Public"
    
    // MARK: - Alerts & Navigation
    
    @State private var showingPublishedAlert = false
    @State private var showingValidationAlert = false
    @State private var validationMessage = ""
    @State private var goToNotesHub = false
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Subjects
    
    let subjects = [
        "Data Structures",
        "Software Engineering",
        "Database",
        "Programming",
        "Computer Networks",
        "Web Development",
        "Others"
    ]
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    // MARK: Header
                    header
                    
                    // MARK: Basic Information
                    basicInformationCard
                    
                    // MARK: Upload File
                    uploadFileCard
                    
                    // MARK: Sharing
                    sharingCard
                    
                    Spacer()
                        .frame(height: 60)
                }
                .padding(.horizontal, 18)
                .padding(.top, 10)
            }
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        
        // MARK: Bottom Button
        .safeAreaInset(edge: .bottom) {
            bottomButtons
        }
        
        // MARK: Validation Alert
        .alert(
            "Please Complete All Fields",
            isPresented: $showingValidationAlert
        ) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(validationMessage)
        }
        
        // MARK: Published Alert
        .alert(
            "Note Published!",
            isPresented: $showingPublishedAlert
        ) {
            Button("Done") {
                NotificationCenter.default.post(name: NSNotification.Name("PopToHomeRoot"), object: nil)
                dismiss()
            }
        } message: {
            Text("Your notes are now available on CampusBuddy.")
        }
        
        // MARK: File Picker
        .fileImporter(
            isPresented: $showingFilePicker,
            allowedContentTypes: [
                .pdf,
                .data
            ],
            allowsMultipleSelection: false
        ) { result in
            handleFileSelection(result)
        }
    }
}


// MARK: - Validation

extension UploadNotesView {
    
    private func validateBeforePublishing() -> Bool {
        
        // Check Notes Title
        
        if notesTitle
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
            .isEmpty {
            
            validationMessage =
                "Please enter a notes title."
            
            return false
        }
        
        // Check Subject
        
        if subject.isEmpty {
            
            validationMessage =
                "Please select a subject or course."
            
            return false
        }
        
        // Check Description
        
        if notesDescription
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
            .isEmpty {
            
            validationMessage =
                "Please enter a description."
            
            return false
        }
        
        // Check File
        
        if selectedFileName.isEmpty {
            
            validationMessage =
                "Please upload a file before publishing."
            
            return false
        }
        
        return true
    }
}


// MARK: - Header

extension UploadNotesView {
    
    private var header: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 38, height: 38)
                        .shadow(color: .black.opacity(0.12), radius: 4, y: 2)
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.color)
                }
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            VStack(spacing: 3) {
                Text("Upload Notes")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.color)
                
                Text("Share your knowledge with buddies")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Color.clear
                .frame(width: 38, height: 38)
        }
        .padding(.top, 4)
    }
}



// MARK: - Basic Information

extension UploadNotesView {
    
    private var basicInformationCard: some View {
        
        ModernCard {
            
            sectionHeader(
                number: "01",
                title: "Basic Information",
                subtitle: "Tell students what your notes are about."
            )
            
            VStack(spacing: 18) {
                
                // MARK: Notes Title
                
                modernTextField(
                    title: "Notes Title",
                    placeholder: "e.g. Data Structures Summary Notes",
                    text: $notesTitle
                )
                
                // MARK: Subject
                
                modernSubjectPicker
                
                // MARK: Description
                
                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {
                    
                    fieldLabel("Description")
                    
                    TextEditor(
                        text: $notesDescription
                    )
                    .frame(height: 110)
                    .padding(10)
                    .scrollContentBackground(.hidden)
                    .background(
                        Color(.systemGroupedBackground)
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 16
                        )
                    )
                }
            }
        }
    }
    
    private var modernSubjectPicker: some View {
        
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            
            fieldLabel("Subject / Course")
            
            Menu {
                
                ForEach(
                    subjects,
                    id: \.self
                ) { subject in
                    
                    Button(subject) {
                        self.subject = subject
                    }
                }
                
            } label: {
                
                HStack {
                    
                    Image(
                        systemName: "book.closed"
                    )
                    .foregroundColor(.blue)
                    
                    Text(
                        subject.isEmpty
                        ? "Select subject or course"
                        : subject
                    )
                    .foregroundColor(
                        subject.isEmpty
                        ? .gray
                        : .primary
                    )
                    
                    Spacer()
                    
                    Image(
                        systemName: "chevron.down"
                    )
                    .font(.caption.bold())
                    .foregroundColor(.gray)
                }
                .padding(.horizontal, 15)
                .frame(height: 52)
                .background(
                    Color(.systemGroupedBackground)
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 16
                    )
                )
            }
        }
    }
}


// MARK: - Upload File

extension UploadNotesView {
    
    private var uploadFileCard: some View {
        
        ModernCard {
            
            sectionHeader(
                number: "02",
                title: "Upload File",
                subtitle: "PDF files are recommended."
            )
            
            Button {
                
                showingFilePicker = true
                
            } label: {
                
                VStack(spacing: 14) {
                    
                    ZStack {
                        
                        Circle()
                            .fill(
                                Color.blue.opacity(0.10)
                            )
                            .frame(
                                width: 64,
                                height: 64
                            )
                        
                        Image(
                            systemName: "arrow.up.doc.fill"
                        )
                        .font(
                            .system(
                                size: 25,
                                weight: .semibold
                            )
                        )
                        .foregroundColor(.blue)
                    }
                    
                    Text("Choose a file")
                        .font(.headline.bold())
                        .foregroundColor(.primary)
                    
                    Text(
                        "PDF, DOC or other supported files"
                    )
                    .font(.caption)
                    .foregroundColor(.gray)
                    
                    Text("Browse Files")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                        .padding(
                            .horizontal,
                            24
                        )
                        .padding(
                            .vertical,
                            10
                        )
                        .background(.orange)
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(
                    Color.blue.opacity(0.035)
                )
                .overlay {
                    
                    RoundedRectangle(
                        cornerRadius: 20
                    )
                    .stroke(
                        Color.blue.opacity(0.25),
                        style: StrokeStyle(
                            lineWidth: 1.5,
                            dash: [6]
                        )
                    )
                }
            }
            
            // MARK: Selected File
            
            if !selectedFileName.isEmpty {
                
                selectedFileView
            }
        }
    }
    
    private var selectedFileView: some View {
        
        HStack(spacing: 14) {
            
            ZStack {
                
                RoundedRectangle(
                    cornerRadius: 12
                )
                .fill(
                    Color.red.opacity(0.10)
                )
                
                Image(
                    systemName: "doc.fill"
                )
                .font(.title3)
                .foregroundColor(.red)
            }
            .frame(
                width: 48,
                height: 48
            )
            
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                
                Text(selectedFileName)
                    .font(.subheadline.bold())
                    .lineLimit(1)
                
                Text(
                    selectedFileSize.isEmpty
                    ? "File selected"
                    : selectedFileSize
                )
                .font(.caption)
                .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
                
                selectedFileName = ""
                selectedFileSize = ""
                
            } label: {
                
                Image(
                    systemName: "xmark.circle.fill"
                )
                .font(.title3)
                .foregroundColor(
                    .gray.opacity(0.5)
                )
            }
        }
        .padding(12)
        .background(
            Color(.systemGroupedBackground)
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16
            )
        )
    }
}


// MARK: - Sharing

extension UploadNotesView {
    
    private var sharingCard: some View {
        
        ModernCard {
            
            sectionHeader(
                number: "03",
                title: "Sharing Options",
                subtitle: "Choose who can access your notes."
            )
            
            VStack(spacing: 12) {
                
                modernSharingOption(
                    title: "Public",
                    subtitle: "Everyone can view and download",
                    icon: "globe",
                    value: "Public"
                )
                
                modernSharingOption(
                    title: "Your University Only",
                    subtitle: "Only students from your university",
                    icon: "building.2",
                    value: "University"
                )
            }
        }
    }
    
    private func modernSharingOption(
        title: String,
        subtitle: String,
        icon: String,
        value: String
    ) -> some View {
        
        Button {
            
            sharingOption = value
            
        } label: {
            
            HStack(spacing: 14) {
                
                ZStack {
                    
                    Circle()
                        .fill(
                            sharingOption == value
                            ? Color.blue.opacity(0.12)
                            : Color(.systemGroupedBackground)
                        )
                    
                    Image(systemName: icon)
                        .foregroundColor(
                            sharingOption == value
                            ? .blue
                            : .gray
                        )
                }
                .frame(
                    width: 45,
                    height: 45
                )
                
                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {
                    
                    Text(title)
                        .font(.subheadline.bold())
                        .foregroundColor(.primary)
                    
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(
                    systemName:
                        sharingOption == value
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .font(.title3)
                .foregroundColor(
                    sharingOption == value
                    ? .blue
                    : .gray.opacity(0.35)
                )
            }
            .padding(14)
            .background(
                sharingOption == value
                ? Color.blue.opacity(0.045)
                : Color(.systemGroupedBackground)
            )
            .overlay {
                
                RoundedRectangle(
                    cornerRadius: 17
                )
                .stroke(
                    sharingOption == value
                    ? Color.blue.opacity(0.35)
                    : Color.clear,
                    lineWidth: 1.5
                )
            }
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 17
                )
            )
        }
    }
}


// MARK: - Bottom Buttons

extension UploadNotesView {
    
    private var bottomButtons: some View {
        
        Button {
            
            // Validate everything first
            
            if validateBeforePublishing() {
                
                // Everything is complete
                
                showingPublishedAlert = true
                
            } else {
                
                // Something is missing
                
                showingValidationAlert = true
            }
            
        } label: {
            
            HStack {
                
                Text("Publish Note")
                
                Image(
                    systemName: "arrow.right"
                )
            }
            .font(.subheadline.bold())
            .foregroundColor(.white)
            .frame(
                maxWidth: .infinity
            )
            .frame(height: 54)
            .background(.orange)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 18
                )
            )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            .ultraThinMaterial
        )
    }
}


// MARK: - Reusable Components

extension UploadNotesView {
    
    private func modernTextField(
        title: String,
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            
            fieldLabel(title)
            
            TextField(
                placeholder,
                text: text
            )
            .padding(.horizontal, 15)
            .frame(height: 52)
            .background(
                Color(.systemGroupedBackground)
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 16
                )
            )
        }
    }
    
    private func fieldLabel(
        _ title: String
    ) -> some View {
        
        HStack(spacing: 3) {
            
            Text(title)
                .font(.subheadline.bold())
                .foregroundColor(.primary)
            
            Text("*")
                .foregroundColor(.orange)
                .bold()
        }
    }
    
    private func sectionHeader(
        number: String,
        title: String,
        subtitle: String
    ) -> some View {
        
        HStack(
            alignment: .top,
            spacing: 12
        ) {
            
            Text(number)
                .font(
                    .system(
                        size: 12,
                        weight: .bold
                    )
                )
                .foregroundColor(.white)
                .frame(
                    width: 32,
                    height: 32
                )
                .background(.blue)
                .clipShape(Circle())
            
            VStack(
                alignment: .leading,
                spacing: 3
            ) {
                
                Text(title)
                    .font(
                        .system(
                            size: 21,
                            weight: .bold
                        )
                    )
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
    
    // MARK: File Selection
    
    private func handleFileSelection(
        _ result: Result<[URL], Error>
    ) {
        
        switch result {
            
        case .success(let urls):
            
            guard let url = urls.first else {
                return
            }
            
            selectedFileName =
                url.lastPathComponent
            
            if let attributes =
                try? FileManager.default.attributesOfItem(
                    atPath: url.path
                ),
               let fileSize =
                attributes[.size] as? Int64 {
                
                selectedFileSize =
                    ByteCountFormatter.string(
                        fromByteCount: fileSize,
                        countStyle: .file
                    )
            }
            
        case .failure:
            break
        }
    }
}


// MARK: - Modern Card

struct ModernCard<Content: View>: View {
    
    let content: Content
    
    init(
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(
            alignment: .leading,
            spacing: 20
        ) {
            
            content
        }
        .padding(20)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24
            )
        )
        .shadow(
            color: .black.opacity(0.06),
            radius: 12,
            y: 5
        )
    }
}


// MARK: - Preview

#Preview {
    UploadNotesView()
}
